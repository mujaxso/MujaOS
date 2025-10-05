''
* {
  font-family: "JetBrainsMono Nerd Font", monospace;
  font-size: 14px;
  margin: 0;
  padding: 0;
  border: none;
  color: #e0e0e0;
}

window#waybar {
  background-color: rgba(40, 40, 40, 0.95);
  border-bottom: 2px solid #81a1c1;
}

#workspaces button {
  padding: 6px 14px;
  color: #a0a0a0;
  background-color: transparent;
  border-radius: 8px;
  font-weight: 500;
  letter-spacing: 0.03em;
}

#workspaces button.focused {
  color: #eceff4;
  background-color: #5e81ac;
  border-radius: 10px;
}

#clock,
#cpu,
#memory,
#battery,
#pulseaudio,
#network,
#tray {
  padding: 0 14px;
  margin: 0 6px;
  background-color: rgba(59, 66, 82, 0.8);
  border-radius: 12px;
  font-weight: 600;
}

#battery {
  color: #a3be8c;
  font-weight: 700;
}

#battery.warning {
  color: #ebcb8b;
  font-weight: 700;
}

#battery.critical {
  color: #bf616a;
  font-weight: 700;
}

#network.disconnected {
  color: #bf616a;
  font-weight: 700;
}

#pulseaudio.muted {
  color: #888;
}

tooltip {
  background-color: rgba(46, 52, 64, 0.95);
  color: #d8dee9;
  border-radius: 8px;
  padding: 10px 14px;
  font-size: 13px;
  font-weight: 500;
}

#custom-power {
  color: #bf616a;
  padding: 0 14px;
  font-size: 18px;
  border-radius: 8px;
}

#custom-power:hover {
  background-color: rgba(59, 66, 82, 0.8);
  color: #f07178;
}
''
