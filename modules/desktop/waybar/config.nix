{ lib, ... }:

{
  
  options.services.waybar.settings = lib.mkOption {
    type = lib.types.attrs;
    description = "Waybar JSON configuration.";
    default = {
      layer = "top";
      position = "top";
      mod = "dock";
      exclusive = true;
      passtrough = false;
      gtk-layer-shell = true;
      height = 0;
      
      "modules-left" = [ "hyprland/workspaces" "hyprland/mode" ];
      "modules-center" = [ "hyprland/window" ];
      "modules-right" = [ "clock" "pulseaudio" "tray" "network" "battery"];

      "custom/clock" = {
        exec = "date '+%H:%M'";
        interval = 30;
      };

      clock = {
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
        format = "  {}%";
        format-alt = " {used:0.1f}G";
        max-length = 10;
      };
      backlight = {
        format = "󰖨 {}";
        device = "acpi_video0";
      };
    };
  };
}
