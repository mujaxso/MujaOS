{
  config,
  pkgs,
  ...
}: {
  # Enable Thunar file manager
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin # Archive management
      thunar-volman # Removable device management
      thunar-media-tags-plugin # Media file tagging
    ];
  };

  # Required services
  programs.xfconf.enable = true;
}
