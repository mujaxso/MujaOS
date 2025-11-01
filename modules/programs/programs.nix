{
  config,
  pkgs,
  ...
}: let
  git = ./git.nix;
  gpg = ./gpg.nix;
  editors = ./editors/editors.nix;
  terminals = ./terminals/terminals.nix;
  browsers = ./browsers/browsers.nix;
  videos = ./videos/videos.nix;
  thunderbird = ./thunderbird.nix;
  discord = ./discord.nix;
  yazi = ./yazi.nix;
  thunar = ./thunar.nix;
  feh = ./feh.nix;
  bittorrent = ./bittorrent.nix;
in {
  imports = [
    git
    # gpg
    editors
    terminals
    browsers
    videos
    thunderbird
    discord
    yazi
    # thunar
    feh
    bittorrent
  ];

  home.packages = with pkgs; [
    p7zip
    jq
    poppler
    fd
    ripgrep
    fzf
    zoxide
    resvg
    imagemagick
    wf-recorder
    # Kooha
    #Wayfarer
    pandoc
  ];
}
