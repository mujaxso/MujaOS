{ ... }:

{
  programs.hyprland.settings.general = {
    gaps_in = 5;
    gaps_out = 10;
    border_size = 2;
    "col.active_border" = "rgba(89b4faee)";
    "col.inactive_border" = "rgba(45475aff)";
  };

  programs.hyprland.settings.decoration = {
    rounding = 8;
    blur = {
      enabled = true;
      size = 6;
      passes = 3;
    };
    drop_shadow = true;
    shadow_range = 20;
  };

  programs.hyprland.settings.misc = {
    disable_hyprland_logo = true;
    disable_splash_rendering = true;
  };
}
