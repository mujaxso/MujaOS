{ config, pkgs, ... }:

let
  # define each imported module
  hyprland = ./hyprland/hyprland.nix;
  suckless = ./suckelss/suckless.nix;
  hyprpaper = ./hyprland/hyprpaper.nix;
  waybar = ./waybar/waybar.nix;
  rofi = ./rofi/rofi.nix;
  gtk = ./gtk.nix;
  cursor = ./cursor.nix;
  # dunst = ./dunst.nix;
  wlogout = ./wlogout.nix;
  xdg = ./xdg.nix;
in {
  imports = [
    hyprland
    suckless
    hyprpaper
    waybar
    rofi
    gtk
    cursor
    # dunst
    wlogout
    xdg
  ];
}
