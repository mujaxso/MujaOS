{ pkgs }:
{ exec = "${pkgs.bash}/bin/bash ${pkgs.writeShellScript "memory" ''free -m | awk '/Mem:/ { print int($3/$2*100) }''}"; interval = 5; tooltip = true; format = "{usage}%"; }