{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./emacs.nix
    ./browser/browser.nix
    ./vscode.nix
  ];

}
