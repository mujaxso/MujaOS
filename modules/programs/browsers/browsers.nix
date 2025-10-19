{pkgs, ...}: let
  brave = ./brave.nix;
  brave-extra = ./brave-extra.nix;
  firefox = ./firefox.nix;
in {
  imports = [
    brave
    brave-extra
    firefox
  ];
}
