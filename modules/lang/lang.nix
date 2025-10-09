{ config, pkgs, ... }:

let
  # define each imported module
  c = ./c.nix;
  rust = ./rust.nix;
  nodejs = ./nodejs.nix;
in {
  imports = [
    c
    rust
    nodejs
  ];
}
