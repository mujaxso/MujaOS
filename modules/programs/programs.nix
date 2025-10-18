{ config, pkgs, ... }:
let
  git = ./git.nix;
  editors = ./editors/editors.nix;
  terminals = ./terminals/terminals.nix;
  browsers = ./browsers/browsers.nix;
  videos = ./videos/videos.nix;
  yazi = ./yazi.nix;
  thunar = ./thunar.nix;
  feh = ./feh.nix;
in
{
  imports = [
    git
    editors
    terminals
    browsers
    videos
    yazi
    # thunar
    feh
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
  ];

}
