{ config, pkgs, ... }:

{
  imports = [
    ./hyprland/hyprland.nix
    ./waybar/waybar.nix
    ./rofi/rofi.nix
    ./gtk.nix
    ./kitty.nix
    #./pipewire.nix
    
  ];

}
