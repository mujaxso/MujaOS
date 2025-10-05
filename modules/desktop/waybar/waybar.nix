{ config, pkgs, ... }:

let
  waybarConfig = import ./config.nix;
  waybarStyle = import ./style.nix;
in {
  programs.waybar = {
    #enable = true;
    package = pkgs.waybar;
    systemd.enable = true;
    settings = waybarConfig;
    style = waybarStyle;
  };

  home.file.".config/waybar/scripts/power-menu.sh".source = ./scripts/power-menu.sh;
}
