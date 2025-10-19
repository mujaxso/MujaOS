{pkgs, ...}: let
  ghostty = ./ghostty.nix;
  kitty = ./kitty.nix;
in {
  imports = [
    ghostty
    kitty
  ];
}
