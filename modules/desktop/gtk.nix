{pkgs, ...}: {
  home.packages = with pkgs; [
    materia-theme
    papirus-icon-theme
    gnome-themes-extra
  ];

  gtk = {
    enable = true;

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.gnome-themes-extra;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-enable-event-sounds = 1;
      gtk-enable-input-feedback-sounds = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  # ONLY gtk-2.0 manually (since home-manager doesn't manage gtk-2.0)
  home.file.".config/gtk-2.0/settings.ini".text = ''
    gtk-theme-name = "Adwaita-dark"
    gtk-icon-theme-name = "Papirus-Dark"
    gtk-can-change-accels = 1
  '';
}
