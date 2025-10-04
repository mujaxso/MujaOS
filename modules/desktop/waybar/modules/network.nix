{ pkgs }:
{ exec = "${pkgs.bash}/bin/bash ${pkgs.writeShellScript "network" ''ip route get 1 | awk '{print $7}''}"; interval = 10; tooltip = true; format = "{output}"; }