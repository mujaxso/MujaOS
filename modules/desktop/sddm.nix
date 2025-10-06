{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "chili";
  };

  services.displayManager.sessionPackages = [
    pkgs.hyprland
  ];

  environment.systemPackages = with pkgs; [
    sddm-chili-theme
    qt5.qtquickcontrols
    qt5.qtgraphicaleffects
  ];
}
