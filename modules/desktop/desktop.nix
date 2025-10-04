{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
#    ./kitty.nix
    ./waybar/waybar.nix
    ./sddm.nix
    ./pipewire.nix
    
  ];

  services.waybar.enable = true;
}
