{
  mainBar = {
    layer = "top";
    position = "top";
    mod = "dock";
    exclusive = true;
    passtrough = false;
    gtk-layer-shell = true;
    height = 0;
    
    "modules-left" = [
      "hyprland/workspaces"
      "hyprland/mode"
    ];
    
    "modules-center" = [
      "hyprland/window"
    ];
    
    "modules-right" = [
      "pulseaudio"
      "tray"
      "network"
      "cpu"
      "memory"
      "battery"
      "clock"
      "custom/power"
    ];

    clock = {
      interval = 30;
      format = "{:%H:%M}";
      on-click = "gsimplecal";
    };

    battery = {
      format = "{capacity}% {icon}";
      format-icons = [ "" "" "" "" "" ];
    };

    network = {
      format-wifi = "  {signalStrength}%";
      format-ethernet = " {ipaddr}";
      format-disconnected = "⚠";
    };

    pulseaudio = {
      format = "{volume}% {icon}";
      format-icons = [ "" "" "" ];
    };

    memory = {
      interval = 30;
      format = "  {}%";
      format-alt = " {used:0.1f}G";
      max-length = 10;
    };

    cpu = {
      format = "   {}%";
      format-alt = "{usage}% ";
      tooltip = false;
    };
    
    backlight = {
      format = "󰖨  {}";
      device = "acpi_video0";
    };

    "custom/power" = {
      format = "⏻";
      tooltip = true;
      tooltip-format = "Power Menu";
      on-click = "~/.config/waybar/scripts/power-menu.sh";
    };
  };
}
