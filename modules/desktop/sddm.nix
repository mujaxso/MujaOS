{ config, pkgs, ... }:
{
  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
    services.displayManager.sessionPackages = [ pkgs.hyprland ];

}
