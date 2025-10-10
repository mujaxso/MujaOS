{ pkgs, ...}:
{
  services.dunst = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    
    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        width = 300;
        origin = "top-right";
        offset = "10x10";
        transparency = 10;
        frame_width = 2;
        font = "Droid Sans 9";
        format = "<b>%s</b>\\n%b";
      };
      
      urgency_low = {
        background = "#222222";
        foreground = "#888888";
        timeout = 10;
      };
      
      urgency_normal = {
        background = "#285577";
        foreground = "#ffffff";
        timeout = 10;
      };
      
      urgency_critical = {
        background = "#900000";
        foreground = "#ffffff";
        frame_color = "#ff0000";
        timeout = 0;
      };
    };
  };
}
