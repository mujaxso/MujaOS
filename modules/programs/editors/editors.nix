{ pkgs, ...}:
let
  emacs = ./emacs.nix;
  vscode = ./vscode.nix;
  zed = ./zed.nix;
in
{
  imports = [
    emacs
    vscode
    zed
  ];
}
