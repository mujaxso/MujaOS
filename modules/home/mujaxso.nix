{ config, pkgs, ... }:
{
  imports = [
    ../desktop/desktop.nix
    ../programs/programs.nix
    #../desktop/gtk.nix
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
    rofi
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
