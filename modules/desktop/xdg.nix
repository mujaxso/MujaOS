{
  config,
  pkgs,
  ...
}: {
  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;
    };

    #mimeApps = {
    #  enable = true;
    #  defaultApplications = {
    #   "text/html" = "brave.desktop";
    #  "x-scheme-handler/http" = "brave.desktop";
    # "x-scheme-handler/https" = "brave.desktop";
    # "image/png" = "feh.desktop";
    # "image/jpeg" = "feh.desktop";
    # "image/gif" = "feh.desktop";
    # "video/mp4" = "mpv.desktop";
    # "inode/directory" = "yazi.desktop";
    #};
    #};
  };
}
