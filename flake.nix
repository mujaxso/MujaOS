{
  description = "MujaOS - Modular NixOS flake with Home Manager and VSCodium";

  inputs = {
    # Base system: latest stable NixOS
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    # Extra: nixpkgs unstable for selective packages
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager matching stable
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    agenix.inputs.home-manager.follows = "home-manager";

    musnix.url = "github:musnix/musnix";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nix-flatpak,
    agenix,
    musnix,
    ...
  }: let
    # Supported systems
    systems = ["x86_64-linux"];
    username = "mujaxso";

    # Small helpers to avoid repetition
    forAllSystems = nixpkgs.lib.genAttrs systems;

    mkPkgs = system:
      import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          rocmSupport = true;
        };
      };

    mkPkgsUnstable = system:
      import nixpkgs-unstable {
        inherit system;
        config = {
          allowUnfree = true;
          rocmSupport = true;
        };
      };

    # Convenience aliases for your main system
    system = "x86_64-linux";
    pkgs = mkPkgs system;
    pkgs-unstable = mkPkgsUnstable system;
  in {
    # NixOS hosts
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        pkgs = pkgs;

        # Make unstable & other inputs available to all modules
        specialArgs = {
          inherit
            pkgs-unstable
            username
            nix-flatpak
            agenix
            musnix
            ;
        };

        modules = [
          # Host-specific config
          ./hosts/laptop/laptop.nix

          # Home Manager as NixOS module
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.${username} = import ./modules/home/mujaxso.nix;

            home-manager.extraSpecialArgs = {
              inherit pkgs-unstable nix-flatpak agenix musnix;
            };
          }

          # System-level modules from inputs
          nix-flatpak.nixosModules.nix-flatpak
          agenix.nixosModules.default
          musnix.nixosModules.musnix
        ];
      };
    };

    # Optional: standalone Home Manager (e.g. for non-NixOS)
    homeManagerConfigurations = {
      ${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs system username;

        extraSpecialArgs = {
          inherit pkgs-unstable nix-flatpak agenix musnix;
        };

        configuration = {
          imports = [
            ./modules/home/mujaxso.nix
            nix-flatpak.homeManagerModules.nix-flatpak
            agenix.homeManagerModules.default
          ];
        };
      };
    };

    # Expose pkgs sets if you want quick access in `nix repl` or devShells later
    legacyPackages = forAllSystems (sys: mkPkgs sys);
  };
}
