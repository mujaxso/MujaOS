{ config, pkgs, ... }:
let
  git = ./git.nix;
  editors = ./editors/editors.nix;
  terminals = ./terminals/terminals.nix;
  browsers = ./browsers/browsers.nix;
  yazi = ./yazi.nix;
  feh = ./feh.nix;
  obs = ./obs.nix;
in
{
  imports = [
    git
    editors
    terminals
    browsers
    yazi
    feh
    obs
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
