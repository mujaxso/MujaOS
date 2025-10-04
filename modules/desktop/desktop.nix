{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./kitty.nix
    ./waybar/waybar.nix
  ];

  services.waybar.enable = true;
}
