{ pkgs }:
{ exec = "${pkgs.bash}/bin/bash ${pkgs.writeShellScript "brightness" ''cat /sys/class/backlight/*/brightness''}"; interval = 10; tooltip = true; format = "{output}"; }