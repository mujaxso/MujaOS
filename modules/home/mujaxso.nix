{ config, pkgs, ... }:
{
  home.username = "mujaxso";
  home.homeDirectory = "/home/mujaxso";
  home.sessionVariables = {
    XDG_CONFIG_HOME = "/etc/xdg";
  };
#  home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "etc/hypr";
#  home.file.".config/hypt".force = true;
  programs.home-manager.enable = true;

  # REQUIRED!
  home.stateVersion = "25.05"; # pick your NixOS version

  
  home.packages = with pkgs; [
    firefox
    brave
    git
    rofi
    grim
    slurp
    wl-clipboard
    dunst
    emacs
    neovim
    cliphist
    tree
    unzip
    # nix lsp
    nil
    #waybar
  ];
}
