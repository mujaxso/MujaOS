{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./emacs.nix
    ./brave.nix
    ./vscode.nix
  ];

}
