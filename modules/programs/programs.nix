{ config, pkgs, ... }:
let
  git = ./git.nix;
  editors = ./editors/editors.nix;
  terminals = ./terminals/terminals.nix;
  browsers = ./browsers/browsers.nix;
    
  in
{
  imports = [
    git
    editors
    terminals
    browsers
  ];

}
