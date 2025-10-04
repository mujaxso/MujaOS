{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;
  services.displayManager.sessionPackages = [ pkgs.hyprland ];

}
