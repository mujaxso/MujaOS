{ config, pkgs, ... }:

let
  # define each imported module
  hyprland = ./hyprland/hyprland.nix;
  hyprpaper = ./hyprland/hyprpaper.nix;
  waybar = ./waybar/waybar.nix;
  rofi = ./rofi/rofi.nix;
  gtk = ./gtk.nix;
  cursor = ./cursor.nix;
  dunst = ./dunst.nix;
  wlogout = ./wlogout.nix;
in {
  imports = [
    hyprland
    hyprpaper
    waybar
    rofi
    gtk
    cursor
    dunst
    wlogout
  ];
}
