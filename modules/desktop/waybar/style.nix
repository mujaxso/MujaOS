{ lib, ... }:

{
  options.services.waybar.css = lib.mkOption {
    type = lib.types.str;
    description = "Waybar CSS theme.";
    default = ''
* {
    font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
    font-size: 13px;
}

#waybar {
    background-color: #333333;
    color: #ffffff;
}

button {
    box-shadow: inset 0 -3px transparent;
    border: none;
    border-radius: 0;
    padding: 0 5px;
}

#workspaces button {
    background-color: #5f676a;
    color: #ffffff;
}

#workspaces button:hover {
    background: rgba(0,0,0,0.2);
}

#workspaces button.focused {
    background-color: #285577;
}

#workspaces button.urgent {
    background-color: #900000;
}

#workspaces button.active {
    background-color: #285577;
}

#clock,
#battery,
#cpu,
#memory,
#pulseaudio,
#tray,
#mode,
#idle_inhibitor,
#window,
#workspaces {
    margin: 0 5px;
}


.modules-left > widget:first-child > #workspaces {
    margin-left: 0;
}


.modules-right > widget:last-child > #workspaces {
    margin-right: 0;
}

@keyframes blink {
    to {
        background-color: #ffffff;
        color: #000000;
    }
}

#battery.critical:not(.charging) {
    background-color: #f53c3c;
    color: #ffffff;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

label:focus {
    background-color: #000000;
}

#tray > .passive {
    -gtk-icon-effect: dim;
}

#tray > .needs-attention {
    -gtk-icon-effect: highlight;
    background-color: #eb4d4b;
}

#idle_inhibitor {
    font-size: 15px;
    background-color: #333333;
    padding: 5px;
}

#idle_inhibitor.activated {
    background-color: #285577;
}

    '';
  };
}
