{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    systemd.enable = true;

    # Define one or more bar configurations
    settings = {
      # Example: main bar on primary display
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
        ];

        clock = {
          interval = 30;
          format = "{:%Y-%m-%d %H:%M}";
          
        };

        battery = {
          format = "{capacity}% {icon}";
          format-icons = [ "" "" "" "" "" ];
        };

        network = {
          format-wifi = " {signalStrength}%";
          format-ethernet = " {ipaddr}";
          format-disconnected = "⚠";
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          format-icons = [ "" "" "" ];
        };

        memory = {
          interval = 30;
          format = " mem {}%";
          format-alt = " {used:0.1f}G";
          max-length = 10;
        };

        cpu = {
          format = "  {}%";
          format-alt = "{usage}% ";
          tooltip = false;
        };
        
        backlight = {
          format = "󰖨 {}";
          device = "acpi_video0";
        };
      };
    };

    # Optional: inline CSS styling
    style = ''
      * {
        font-family: "Fira Code";
        font-size: 14px;
      }
      window#waybar {
        background: rgba(40, 40, 40, 0.9);
        color: #ffffff;
      }
    '';
  };
}
