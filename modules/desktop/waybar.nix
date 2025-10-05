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
        height = 30;
        output = [ "eDP-1" ];

        modules-left = [ "hyprland/workspaces" "hyprland/mode" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "clock"
          "battery"
          "pulseaudio"
          "network"
        ];

        # Module-specific settings
        battery = {
          states.critical = 15;
          format = "{capacity}% {icon}";
        };

        clock = {
          format = "%H:%M";
          tooltip-format = "{:%Y-%m-%d %H:%M}";
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
