{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./waybar/waybar.nix
    ./rofi/rofi.nix
    ./gtk.nix
    ./kitty.nix
    #./pipewire.nix
    
  ];

}
