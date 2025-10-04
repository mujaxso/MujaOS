{ config, pkgs, ... }:
{
  imports = [
    ../desktop/kitty.nix
  ];
  
  home.username = "mujaxso";
  home.homeDirectory = "/home/mujaxso";
  home.sessionVariables = {
    XDG_CONFIG_HOME = "/etc/xdg";
  };

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
    eza
    fastfetch
    htop
    btop
];
}
