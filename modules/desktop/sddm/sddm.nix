{
  config,
  pkgs,
  ...
}: let
  # 🪐 Astronaut SDDM Theme (with variant override)
  sddmAstronaut = pkgs.stdenv.mkDerivation {
    pname = "sddm-astronaut-theme";
    version = "1.0-unstable-2025-01-05";

    src = pkgs.fetchFromGitHub {
      owner = "Keyitdev";
      repo = "sddm-astronaut-theme";
      # Pin a specific commit instead of "master"
      rev = "11c0bf6147bbea466ce2e2b0559e9a9abdbcc7c3";
      # Known-good SRI hash for this rev
      sha256 = "sha256-gBSz+k/qgEaIWh1Txdgwlou/Lfrfv3ABzyxYwlrLjDk=";
    };

    dontBuild = true;
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
in {
  # 🖥️ Enable X server (needed for SDDM)
  services.xserver.enable = true;

  # 🚀 Configure SDDM (Qt6 + astronaut theme)
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    # This is the *SDDM theme name* – directory name under share/sddm/themes
    theme = "sddm-astronaut-theme";

    # Use Qt6 SDDM when using astronaut (qt6-only theme)[web:3]
    package = pkgs.kdePackages.sddm;

    # Ensure SDDM gets the right Qt deps
    extraPackages = with pkgs.qt6; [
      qtbase
      qtdeclarative
      qtmultimedia
      qtquick3d
    ];
  };

  # 🌈 Add Hyprland sessions
  services.displayManager.sessionPackages = [pkgs.hyprland];

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
