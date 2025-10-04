{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ waybar ];

  home-manager.users.mujaxso = {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          modules-left = [ "hyprland/workspaces" ];
          modules-center = [ "clock" ];
          modules-right = [ "pulseaudio" "network" "battery" "tray" ];
          clock = { format = "{:%Y-%m-%d %H:%M}"; };
          battery = { format = "{capacity}% {icon}"; format-icons = [ "" "" "" "" "" ]; };
          network = { format-wifi = " {signalStrength}%"; format-ethernet = " {ipaddr}"; format-disconnected = "⚠"; };
          pulseaudio = { format = "{volume}% {icon}"; format-icons = [ "" "" "" ]; };
        };
      };
      style = ''
        * { border: none; font-family: "JetBrains Mono", monospace; font-size: 13px; }
        window#waybar { background-color: rgba(30,30,30,0.9); color: #fff; }
        #workspaces button.active { border-bottom: 2px solid #fff; }
      '';
    };
  };
}