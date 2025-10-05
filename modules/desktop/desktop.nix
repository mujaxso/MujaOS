{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./gtk.nix
    ./kitty.nix
    ./waybar.nix
    #./pipewire.nix
    
  ];

}
