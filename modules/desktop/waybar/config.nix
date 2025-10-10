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
      "custom/notification"
      "battery"
      "clock"
      "custom/exit"
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
      format-ethernet = "󰈀 {ipaddr}";
      format-disconnected = "󰌙";
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

    "custom/exit" = {
      tooltip = false;
      format = "";
      on-click = "sleep 0.1 && wlogout";
    };

    # "custom/notification" = {
    #   tooltip = false;
    #   format = "{icon}";
    #   #format = "  󰂚 󱅫 ";
    #   #format-icons = {};
    #   format-icons = {
    #     notification = "󰂚";
    #     none = "󱅫";
    #   };
    #   return-type = "json";
    #   exec-if = "which dunstctl";
    #   exec = "~/.config/waybar/scripts/dunst-waybar.sh";
    #   on-click = "dunstctl history-pop";
    #   on-click-right = "dunstctl close-all";
    #   signal = 8;
    #   escape = true;
    # };

    "custom/notification" = {
      tooltip = false;
      format = "{icon} {}";
      format-icons = {
        notification = "<span foreground='red'><sup></sup></span>";
        none = "";
        dnd-notification = "<span foreground='red'><sup></sup></span>";
        dnd-none = "";
        inhibited-notification = "<span foreground='red'><sup></sup></span>";
        inhibited-none = "";
        dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
        dnd-inhibited-none = "";
      };
      return-type = "json";
      exec-if = "which swaync-client";
      exec = "swaync-client -swb";
      on-click = "sleep 0.1 && task-waybar";
      escape = true;
    };

    "hyprland/workspaces" = {
      format = "{icon}";  # or "{id}" or "{name} {icon}" etc.
      format-icons = {
        "1" = "󰖟";
        "2" = "";
        "3" = "";
      };
      sort-by-number = true;
      all-outputs = true;
      on-click = "activate";
      disable-scroll = false;
    };

    "hyprland/window" = {
      format = "{title}";
      icon = false;
      expand = true;
      max-length = 20;
      separate-outputs = true;
    };

    "custom/playerctl" = {
      format = "{icon}  <span>{}</span>";
      "return-type" = "json";
      "max-length" = 333;
      exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} ~ {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
      "on-click-middle" = "playerctl play-pause";
      "on-click" = "playerctl previous";
      "on-click-right" = "playerctl next";
      "format-icons" = {
        Playing = "<span foreground='#98BB6C'></span>";
        Paused = "<span foreground='#E46876'></span>";
      };
    };

  };
}
