{ pkgs, ... }:
{
  # gtk = {
  #   enable = true;
  #   theme = {
  #     name = "Materia-dark";
  #     package = pkgs.materia-theme;
  #   };
  # };
  home.packages = with pkgs; [
    materia-theme
    papirus-icon-theme
    gnome-themes-extra
  ];
  
  # gtk = {
  #   enable = true;

  #   theme = {
  #     name = "Materia-dark";  # Match the name of the installed theme
  #     package = pkgs.materia-theme;
  #   };

  #   iconTheme = {
  #     name = "Papirus-Dark";
  #     package = pkgs.papirus-icon-theme;
  #   };

  #   cursorTheme = {
  #     name = "Adwaita";
  #     package = pkgs.adwaita-icon-theme;
  #   };
  # };
  
  # gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
  # gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;


  # home.sessionVariables = {
  #   GTK_THEME = "Adwaita-dark";
  #   ICON_THEME = "Papirus-Dark";
  #   # Other GTK-related variables if needed
  # };

  # If you want GTK config files:
  home.file.".config/gtk-2.0/settings.ini".text = ''
    gtk-theme-name = "Materia-dark"
    gtk-icon-theme-name = "Papirus-Dark"
    gtk-can-change-accels = 1

'';
  home.file.".config/gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name = Materia-dark
    gtk-icon-theme-name = Papirus-Dark
    gtk-cursor-theme-name = Bibata-Modern-Ice
    gtk-font-name = Cantarell 11
    gtk-application-prefer-dark-theme=true
    gtk-font-name=FiraCode Retina
    gtk-toolbar-style=GTK_TOOLBAR_ICONS
    gtk-toolbar-icon-size=GTK_ICON_SIZE_SMALL_TOOLBAR
    gtk-button-images=1
    gtk-menu-images=1
    gtk-enable-event-sounds=1
    gtk-enable-input-feedback-sounds=1
    gtk-xft-antialias=1
    gtk-xft-hinting=1
    gtk-xft-hintstyle=hintslight
    gtk-xft-rgba=rgb
    gtk-cursor-theme-size=0
    gtk-cursor-theme-name=Default
    gtk-key-theme-name=Default
  '';

  home.file.".config/gtk-4.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name = Materia-dark
    gtk-font-name = Cantarell 11
    gtk-cursor-theme-name = Adwaita
    gtk-application-prefer-dark-theme=true
  '';

}
