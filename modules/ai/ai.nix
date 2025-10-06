{ config, pkgs, ... }:

let
  # define each imported module
  aider = ./aider.nix;
in {
  imports = [
    aider
  ];
}
