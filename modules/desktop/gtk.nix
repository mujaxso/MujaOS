{ pkgs, ... }:
{
  # gtk = {
  #   enable = true;
  #   theme = {
  #     name = "Materia-dark";
  #     package = pkgs.materia-theme;
  #   };
  # };

  # gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
  # gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;


  home.sessionVariables = {
    GTK_THEME = "Adwaita-dark";
    ICON_THEME = "Papirus-Dark";
    # Other GTK-related variables if needed
  };

  # If you want GTK config files:
  home.file.".config/gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name = Adwaita-dark
    gtk-font-name = Cantarell 11
  '';

  home.file.".config/gtk-4.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name = Adwaita-dark
    gtk-font-name = Cantarell 11
  '';

  home.packages = with pkgs; [
    
    papirus-icon-theme
  ];

}
