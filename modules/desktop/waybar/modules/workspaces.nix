{ pkgs }:
{ exec = "${pkgs.bash}/bin/bash ${pkgs.writeShellScript "workspaces" ''swaymsg -t get_workspaces | jq -r '.[] | select(.focused==true) | .name''}"; interval = 1; tooltip = true; }