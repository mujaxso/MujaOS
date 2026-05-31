{pkgs, ...}: let
  emacs = ./emacs.nix;
  vscode = ./vscode.nix;
  zed = ./zed.nix;
  cursor = ./cursor.nix;
in {
  imports = [
    emacs
    vscode
    zed
    cursor
  ];
}
