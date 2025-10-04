{ pkgs }:
{ exec = "${pkgs.bash}/bin/bash ${pkgs.writeShellScript "weather" ''curl -s 'wttr.in/?format=1' | head -n1''}"; interval = 600; tooltip = true; format = "{output}"; }