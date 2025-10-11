{ config, pkgs, ... }:
let
  git = ./git.nix;
  editors = ./editors/editors.nix;
  terminals = ./terminals/terminals.nix;
  browsers = ./browsers/browsers.nix;
  yazi = ./yazi.nix;
  in
{
  imports = [
    git
    editors
    terminals
    browsers
    yazi
  ];

  home.packages = with pkgs; [
    ffmpeg
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
