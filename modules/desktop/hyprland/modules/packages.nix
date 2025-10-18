{ pkgs }:

with pkgs; [
  hyprland
  # xdg-desktop-portal-hyprland
  hyprlock
  hyprpaper
  #wlogout
  playerctl

  grim          # Screenshot tool
  slurp         # Region selector
  wl-clipboard  # Clipboard support
  grimblast     # Hyprland screenshot utility
  pavucontrol   # audio control
  
  dunst         #
  libnotify     # Notifications
  swaynotificationcenter

  kdePackages.xwaylandvideobridge  # Enables screen sharing for Discord/Skype

]
