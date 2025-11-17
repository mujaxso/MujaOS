{
  description = "MujaOS - Modular NixOS flake with Home Manager and VSCodium";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    agenix.inputs.home-manager.follows = "home-manager";
    musnix.url = "github:musnix/musnix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    agenix,
    musnix,
    ...
  } @ inputs: let
    systems = ["x86_64-linux"];
    username = "mujaxso";

    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config = {
            allowUnfree = true;
          };
        };
        modules = [
          ./hosts/laptop/laptop.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./modules/home/mujaxso.nix;
          }
          agenix.nixosModules.default
          musnix.nixosModules.musnix # Import musnix module
        ];
      };
    };

    homeManagerConfigurations = {
      "${username}" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config = {
            allowUnfree = true;
          };
        };
        system = "x86_64-linux";
        username = username;
        configuration = {
          imports = [
            ./modules/home/mujaxso.nix
            agenix.homeManagerModules.default
          ];
        };
      };
    };
  };
}
