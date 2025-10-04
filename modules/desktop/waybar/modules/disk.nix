{ pkgs }:
{ exec = "${pkgs.bash}/bin/bash ${pkgs.writeShellScript "disk" ''df -h / | awk 'NR==2 {print $5}''}"; interval = 60; tooltip = true; format = "{output}"; }