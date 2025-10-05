{ config, pkgs, ... }:

{
  imports = [
    ./hyprland/hyprland.nix
    ./hyprland/hyprpaper.nix
    ./waybar/waybar.nix
    ./rofi/rofi.nix
    ./gtk.nix
    ./kitty.nix
    #./pipewire.nix
    
  ];

}
