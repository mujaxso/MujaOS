{
  description = "MujaOS - Modular NixOS flake with Home Manager and VSCode setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
      {
        # NixOS system configuration
        nixosConfigurations = {
          laptop = nixpkgs.lib.nixosSystem {
            inherit system;

            pkgs = pkgs;

            modules = [
              ./hosts/laptop/laptop.nix

              # Enable Home Manager NixOS module
              home-manager.nixosModules.home-manager

              {
                # Configure Home Manager users here (optional if you want)
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;

                # Example: import user config for mujaxso (optional here)
                home-manager.users.mujaxso = import ./modules/home/mujaxso.nix;
              }
            ];
          };
        };

        # Home Manager user config managed via flakes (recommended)
        homeManagerConfigurations = {
          mujaxso = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            system = system;
            username = "mujaxso";

            configuration = import ./modules/home/mujaxso.nix;

           
          };
        };
      };
}
