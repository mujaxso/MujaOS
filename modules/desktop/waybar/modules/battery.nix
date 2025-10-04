{ pkgs }:
{ exec = "${pkgs.bash}/bin/bash ${pkgs.writeShellScript "battery" ''cat /sys/class/power_supply/BAT0/capacity''}"; interval = 30; tooltip = true; format = "{capacity}%"; }