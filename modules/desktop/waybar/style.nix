''
  * {
    font-family: "JetBrainsMono Nerd Font", monospace;
    font-size: 14px;
    border: none;
    margin: 0;
    padding: 0;
  }

  window#waybar {
    background-color: rgba(30, 30, 30, 0.95);
    color: #ffffff;
    border-bottom: 2px solid #5e81ac;
  }

  #workspaces button {
    padding: 0 10px;
    color: #888;
    background: transparent;
  }

  #workspaces button.focused {
    color: #fff;
    background-color: #5e81ac;
    border-radius: 6px;
  }

  #clock,
  #cpu,
  #memory,
  #battery,
  #pulseaudio,
  #network,
  #tray {
    padding: 0 10px;
    margin: 0 4px;
    background-color: #3b4252;
    border-radius: 5px;
  }

  #battery {
    color: #a3be8c;
  }

  #battery.warning {
    color: #ebcb8b;
  }

  #battery.critical {
    color: #bf616a;
  }

  #network.disconnected {
    color: #bf616a;
  }

  #pulseaudio.muted {
    color: #888;
  }

  tooltip {
    background-color: #2e3440;
    color: #ffffff;
    border-radius: 4px;
    padding: 8px;
  }

  #custom-power {
    color: #bf616a;
    padding: 0 10px;
    font-size: 16px;
  }

  #custom-power:hover {
    background-color: #3b4252;
    border-radius: 5px;
  }

''
