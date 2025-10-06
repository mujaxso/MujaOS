{ config, pkgs, ... }:

let
  # define each imported module
  hyprland = ./hyprland/hyprland.nix;
  hyprpaper = ./hyprland/hyprpaper.nix;
  waybar = ./waybar/waybar.nix;
  rofi = ./rofi/rofi.nix;
  gtk = ./gtk.nix;
  kitty = ./kitty.nix;
  cursor = ./cursor.nix;
  # pipewire = ./pipewire.nix;
in {
  imports = [
    hyprland
    hyprpaper
    waybar
    rofi
    gtk
    kitty
    cursor
    # pipewire
  ];
}
