{ config, pkgs, ... }:

let
  # define each imported module
  c = ./c.nix;
  rust = ./rust.nix;
in {
  imports = [
    c
    rust
  ];
}
