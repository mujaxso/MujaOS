{mkLuaInline}: {
  _args = [
    "hyprland.start"
    (mkLuaInline ''
      function()
        hl.exec_cmd("waybar")
        hl.exec_cmd("hyprpaper")
        hl.exec_cmd("cliphist wl-paste --watch")
        hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
        hl.exec_cmd("swaync")
        hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
        hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
        hl.exec_cmd("sleep 1 && killall -e xdg-desktop-portal-hyprland && killall -e xdg-desktop-portal")
        hl.exec_cmd("sleep 2 && systemctl --user start xdg-desktop-portal-hyprland")
      end
    '')
  ];
}
