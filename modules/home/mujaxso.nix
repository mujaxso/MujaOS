{
  config,
  pkgs,
  lib,
  ...
}: let
  username = "mujaxso";
  homeDir = "/home/${username}";

  imports = [
    ../desktop/desktop.nix
    ../programs/programs.nix
    #../lang/lang.nix
    ../ai/ai.nix
    ../virtualization/virtualization.nix
  ];
in {
  inherit imports;

  home = {
    username = username;
    homeDirectory = homeDir;

    sessionVariables = {
      # GTK_THEME = "Materia-dark";
      XDG_CONFIG_HOME = lib.mkForce "${homeDir}/.config";
      EDITOR = "nvim";
      MOZ_ENABLE_WAYLAND = "1";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
    };
  };

  programs.home-manager.enable = true;

  # REQUIRED!
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    dunst
    neovim
    cliphist
    tree
    unzip
    nil
    eza
    fastfetch
    htop
    btop
    alacritty
    pcmanfm
    brightnessctl
  ];
}
