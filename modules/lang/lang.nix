{ config, pkgs, ... }:

let
  # define each imported module
  c = ./c.nix;
  zig = ./zig.nix;
  rust = ./rust.nix;
  nodejs = ./nodejs.nix;
in {
  imports = [
    c
    zig
    rust
    nodejs
  ];
}
