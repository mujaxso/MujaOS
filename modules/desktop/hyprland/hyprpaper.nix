{ config, pkgs, ... }:

let
  wallpaperPath = "${config.home.homeDirectory}/Images/wallpapers/cubes.jpg";
in
{
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    wallpaper {
        monitor = *
        path = ${wallpaperPath}
    }
  '';

}
