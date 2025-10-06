{ config, pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha-mauve";

    settings = {
      Theme = {
        ThemeDir = "${pkgs.catppuccin-sddm.override {
          flavor = "mocha";
          accent = "mauve";
          font = "Noto Sans";
          fontSize = "9";
          background = "${./wallpaper.png}";
          loginBackground = true;
        }}/share/sddm/themes";
      };
    };
  };

  services.displayManager.sessionPackages = [
    pkgs.hyprland
  ];

  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      accent = "mauve";
      font = "JetBrainsMono Nerd Font";
      fontSize = "10";
      background = "${./wallpaper.png}";
      loginBackground = true;
    })
  ];
}
