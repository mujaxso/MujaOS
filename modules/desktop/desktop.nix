{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./kitty.nix
    ./waybar.nix
  ];
}
