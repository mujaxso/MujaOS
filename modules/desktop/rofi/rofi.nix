{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi; # or `rofi-wayland` for Wayland
    theme = "mujaos-theme";
  };

  home.file.".config/rofi/themes/power-theme.rasi".source = ./themes/power-theme.rasi;
  
   home.file.".config/rofi/themes/mujaos-theme.rasi".source = ./themes/mujaos-theme.rasi;
}
