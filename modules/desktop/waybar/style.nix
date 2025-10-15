''
* {
    font-family: "Ubuntu Mono Nerd Font", "Ubuntu Mono", monospace, "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    font-weight: 500;
    font-size: 14px;
    color: #eeeeee;
}

#waybar {
    background: rgba(0, 0, 0, 0);
    box-shadow: none;
    border: none;
    padding: 6px 12px;
}

#waybar * {
    background: transparent;
    border: none;
    box-shadow: none;
}

#waybar .module {
    padding: 0 10px;
    margin: 0 5px;
    border-radius: 6px;
    transition: background-color 0.3s ease;
}

#waybar .module:hover {
    background-color: rgba(255, 255, 255, 0.1);
}

#waybar .clock {
    font-weight: 600;
    font-size: 13px;
}

#waybar .battery,
#waybar .cpu,
#waybar .network {
    font-weight: 600;
}

#custom-notification {
  font-family: "JetBrainsMono Nerd Font";
}

/* Optional separator */
#waybar .separator {
    margin: 0 8px;
    color: #666666;
}

/* Tooltip */
.tooltip {
    background-color: rgba(0, 0, 0, 0.7);
    color: #eee;
    border-radius: 4px;
    padding: 3px 6px;
    font-size: 11px;
}
''
