{ pkgs }:
{ exec = "${pkgs.bash}/bin/bash ${pkgs.writeShellScript "cpu" ''top -bn1 | grep "Cpu(s)" | awk '{print int($2 + $4)}''}"; interval = 2; tooltip = true; format = "{usage}%"; }