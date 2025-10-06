{ config, pkgs, lib, ... }:

let
  username = "mujaxso";
  homeDir = "/home/${username}";

  imports = [
    ../desktop/desktop.nix
    ../programs/programs.nix
    ../ai/ai.nix
  ];
in {
  inherit imports;

  home.username = username;
  home.homeDirectory = homeDir;

  home.sessionVariables = {
    # GTK_THEME = "Materia-dark";
    XDG_CONFIG_HOME = lib.mkForce "${homeDir}/.config";
    EDITOR = "nvim";
  };

  xdg.enable = true;
  
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
  ];
}
