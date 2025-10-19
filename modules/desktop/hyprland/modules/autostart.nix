[
  "waybar"
  "hyprpaper"
  "nm-applet --indicator"
  "cliphist wl-paste --watch"
  "hyprctl setcursor Bibata-Modern-Ice 24"
  # "dunst"
  "swaync"
  # Export environment first
  "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
  "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

  # force restart portals
  "sleep 1 && killall -e xdg-desktop-portal-hyprland && killall -e xdg-desktop-portal"
  "sleep 2 && systemctl --user start xdg-desktop-portal-hyprland"
]
