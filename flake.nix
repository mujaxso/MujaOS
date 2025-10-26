{
  description = "MujaOS - Modular NixOS flake with Home Manager and VSCodium";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    agenix.url = "github:ryantm/agenix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    agenix,
    ...
  } @ inputs: let
    # Systems for docker image builds
    systems = ["x86_64-linux" "aarch64-linux"];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        modules = [
          ./hosts/laptop/laptop.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.mujaxso = import ./modules/home/mujaxso.nix;
          }
          agenix.nixosModules.default
        ];
      };
    };

    homeManagerConfigurations = {
      "mujaxso" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        system = "x86_64-linux";
        username = "mujaxso";
        configuration = {
          imports = [
            ./modules/home/mujaxso.nix
            agenix.homeManagerModules.default
          ];
        };
      };
    };

    # Add only Docker/OCI image outputs (no extra packages/modules)
    packages = forAllSystems (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        # Build a minimal image from your already-built runtime.
        # Wire this to your module's package output by replacing the placeholder below.
        mujaos-image = pkgs.dockerTools.buildImage {
          name = "mujaos";
          tag = "latest";

          # Replace the placeholder with the package your modules build, e.g.:
          # paths = [ self.packages.${system}.mujaosPkg ];
          # Ensure that package installs your binary under $out/bin, or adjust Cmd accordingly.
          copyToRoot = pkgs.buildEnv {
            name = "image-root";
            paths = [
              # TODO: replace with your real package output, e.g. self.packages.${system}.mujaosPkg
              # Example fallback: put a tiny placeholder script in /bin to validate wiring
              (pkgs.runCommand "mujaos-placeholder" {} ''
                mkdir -p $out/bin
                cat > $out/bin/mujaos <<'EOF'
                #!/usr/bin/env bash
                echo "MujaOS container placeholder - replace copyToRoot.paths with your real package"
                EOF
                chmod +x $out/bin/mujaos
              '')
            ];
            pathsToLink = ["/bin"];
          };

          config = {
            Cmd = ["/bin/mujaos"];
            WorkingDir = "/";
            # ExposedPorts = { "8080/tcp" = { }; }; # uncomment if your app listens on a port
          };
        };
      }
    );

    # Optional convenience: a helper app to build and docker load the image locally
    apps = forAllSystems (system: {
      loadImage = {
        type = "app";
        program = "${nixpkgs.legacyPackages.${system}.bash}/bin/bash";
        args = [
          "-lc"
          "nix build .#packages.${system}.mujaos-image && docker load < result"
        ];
      };
    });
  };
}
