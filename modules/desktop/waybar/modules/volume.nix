{ pkgs }:
{ exec = "${pkgs.pulseaudio}/bin/pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1"; interval = 5; tooltip = true; format = "{output}"; }