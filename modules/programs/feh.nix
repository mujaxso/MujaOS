{ pkgs, ...}:
{
  programs.feh = {
    enable = true;
    
    themes = {
      wallpaper = [
        "--bg-fill"
        "--no-fehbg"
      ];
      thumbnails = [
        "--thumbnails"
        "--thumb-width"
        "200"
        "--thumb-height"
        "200"
      ];
    };

    buttons = {
      zoom_in = "C-4";
      zoom_out = "C-5";
    };

    keybindings = {
      zoom_in = "plus";
      zoom_out = "minus";
      scroll_up = "k";
      scroll_down = "j";
    };
  };
}
