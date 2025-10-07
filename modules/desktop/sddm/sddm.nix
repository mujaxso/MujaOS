{ config, pkgs, ... }:

let
  # 🪐 Astronaut SDDM Theme (with variant override)
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

      # ✅ Optional variant (Cyberpunk, Nord, TokyoNight, etc.)
      cat > $out/share/sddm/themes/sddm-astronaut-theme/theme.conf.user <<EOF
      [General]
      theme=Cyberpunk
      EOF
    '';
  };
in
{
  # 🖥️ Enable X server (needed for SDDM)
  services.xserver.enable = true;

  # 🚀 Configure SDDM
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme"; # default theme
    extraPackages = with pkgs.qt6; [
      qtbase
      qtdeclarative
      qtmultimedia
      qtquick3d
    ];
  };

  # 🌈 Add Hyprland sessions
  services.displayManager.sessionPackages = [ pkgs.hyprland ];

  # 📦 Install Astronaut + Catppuccin themes
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
