{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.thunderbird
  ];

  # xdg.mimeApps = {
  #   enable = true;
  #   defaultApplications = {
  #     "x-scheme-handler/mailto" = "thunderbird.desktop";
  #     "message/rfc822" = "thunderbird.desktop";
  #   };
  #   associations.added = {
  #     "x-scheme-handler/mailto" = ["thunderbird.desktop"];
  #     "message/rfc822" = ["thunderbird.desktop"];
  #   };
  # };
}
