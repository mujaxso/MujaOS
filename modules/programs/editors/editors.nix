{ pkgs, ...}:
let
  emacs = ./emacs.nix;
  vscode = ./vscode.nix;
  in
{
  imports = [
    emacs
    vscode
  ];
}
