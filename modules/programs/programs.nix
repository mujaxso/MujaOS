{ config, pkgs, ... }:

{
  imports = [
    ./emacs.nix
    ./brave.nix
    ./vscode.nix
  ];

}
