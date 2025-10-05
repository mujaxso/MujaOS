{ config, pkgs, ... }:

let
  wallpaperPath = "~/Images/wallpapers/cubes.jpg";
in
{
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${wallpaperPath}
    wallpaper = ,${wallpaperPath}
  '';

}
