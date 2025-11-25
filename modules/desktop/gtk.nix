{pkgs, ...}: {
  home.packages = with pkgs; [
    # --- Themes ---
    materia-theme # GTK2 + GTK3 + GTK4 theme (dark)

    # --- Icons ---
    papirus-icon-theme

    # --- Cursors ---
    adwaita-icon-theme

    # --- Required GTK2 engines for XWayland + REAPER ---
    gtk2
    gtk_engines
    gtk-engine-murrine

    xwayland
  ];

  gtk = {
    enable = true;

    # GTK THEME (Materia-dark)
    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };

    # ICON THEME
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    # CURSOR THEME
    cursorTheme = {
      name = "Adwaita";
      size = 24;
      package = pkgs.adwaita-icon-theme;
    };

    # GTK 3
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-cursor-theme-size = 24;
      gtk-enable-event-sounds = 1;
      gtk-enable-input-feedback-sounds = 1;
    };

    # GTK 4
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-cursor-theme-size = 24;
    };
  };

  # GTK 2
  home.file.".config/gtk-2.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name = Materia-dark
    gtk-icon-theme-name = Papirus-Dark
    gtk-cursor-theme-name = Adwaita
    gtk-cursor-theme-size = 24

    gtk-application-prefer-dark-theme = 1

    gtk-enable-event-sounds = 1
    gtk-enable-input-feedback-sounds = 1

    gtk-toolbar-style = GTK_TOOLBAR_BOTH
    gtk-menu-images = 1
    gtk-button-images = 1

    # Make sure GTK2 finds theme engines
    gtk-fallback-icon-theme = adwaita
  '';

  # GTK2 rc file (some GTK2 apps prefer this)
  home.file.".config/gtk-2.0/gtkrc".text = ''
    gtk-theme-name="Materia-dark"
    gtk-icon-theme-name="Papirus-Dark"
    gtk-cursor-theme-name="Adwaita"
  '';
}
