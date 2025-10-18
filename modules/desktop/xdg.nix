{ config, pkgs, ... }:

{
  xdg = {
    enable = true;
    # xdgOpenUsePortal = true;

    # XDG user directories (optional)
    userDirs = {
      enable = true;
      createDirectories = true;
    };
    
    # # XDG mime types (optional)
    # mimeApps = {
    #   enable = true;
    #   defaultApplications = {
    #     "text/html" = "brave.desktop";
    #     "x-scheme-handler/http" = "brave.desktop";
    #     "x-scheme-handler/https" = "brave.desktop";
    #     "image/png" = "feh.desktop";
    #     "image/jpeg" = "feh.desktop";
    #     "image/gif" = "feh.desktop";
    #     "video/mp4" = "mpv.desktop";
    #     "inode/directory" = "yazi.desktop";
    #   };
    # };
    
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland  # Primary portal
        pkgs.xdg-desktop-portal-gtk       # Fallback for file pickers
      ];
      config = {
        common = {
          default = [ "hyprland" "gtk" ];
        };
        hyprland = {
          default = [ "hyprland" "gtk" ];
          "org.freedesktop.impl.portal.ScreenCast" = [ "hyprland" ];
          "org.freedesktop.impl.portal.Screenshot" = [ "hyprland" ];
        };
      };
    };
  };
}
