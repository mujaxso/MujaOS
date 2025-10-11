{ pkgs }:

with pkgs; [
  hyprland
  xdg-desktop-portal-hyprland
  hyprlock
  hyprpaper
  #wlogout
  playerctl

  grim          # Screenshot tool
  slurp         # Region selector
  wl-clipboard  # Clipboard support
  grimblast     # Hyprland screenshot utility
  
  dunst         #
  libnotify     # Notifications
  swaynotificationcenter

]
