{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ kitty ];

  home-manager.users.mujaxso = {
    programs.kitty = {
      enable = true;
      settings = {
        font_size = 12;
        background_opacity = "0.9";
        confirm_os_window_close = 0;
      };
    };
  };
}