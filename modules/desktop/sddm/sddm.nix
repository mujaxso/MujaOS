{ config, pkgs, ... }:

let
  sddmAstronaut = pkgs.stdenv.mkDerivation {
    pname = "sddm-astronaut-theme";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "Keyitdev";
      repo = "sddm-astronaut-theme";
      rev = "master";
      sha256 = "071kvv86aha5yy3f5x39awdz3mbwmrmrdrndhdf7yjg7qj49yfr1";
    };

    dontWrapQtApps = true;

    installPhase = ''
      mkdir -p $out/share/sddm/themes/sddm-astronaut-theme
      cp -r * $out/share/sddm/themes/sddm-astronaut-theme
    '';
  };
in
{
  # Enable X server
  services.xserver.enable = true;

  # Enable SDDM and set Astronaut as default theme
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";

    # Provide Qt libraries SDDM needs to run the Astronaut theme
    extraPackages = with pkgs.qt6; [
      qtbase
      qtdeclarative
      qtmultimedia
      qtquick3d
    ];
  };

  # Hyprland session
  services.displayManager.sessionPackages = [ pkgs.hyprland ];

  # Install both themes
  environment.systemPackages = with pkgs; [
    sddmAstronaut

    (catppuccin-sddm.override {
      flavor = "mocha";
      accent = "mauve";
      font = "JetBrainsMono Nerd Font";
      fontSize = "10";
      loginBackground = true;
    })
  ];
}
