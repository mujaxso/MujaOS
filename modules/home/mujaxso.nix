{ config, pkgs, lib,... }:
{
  imports = [
    ../desktop/desktop.nix
    ../programs/programs.nix
    #../desktop/gtk.nix
  ];
  
  home.username = "mujaxso";
  home.homeDirectory = "/home/mujaxso";
  home.sessionVariables = {
    #GTK_THEME = "Materia-dark";
    XDG_CONFIG_HOME = lib.mkForce "${config.home.homeDirectory}/.config";
  };
  xdg.enable = true;

  programs.home-manager.enable = true;
  
  # REQUIRED!
  home.stateVersion = "25.05"; # pick your NixOS version

  
  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    dunst
    neovim
    cliphist
    tree
    unzip
    # nix lsp
    nil
    eza
    fastfetch
    htop
    btop
    alacritty
    pcmanfm
  ];
}
