{
  config,
  pkgs,
  ...
}: let
  # define each imported module
  aider = ./aider.nix;
  codex = ./codex.nix;
in {
  imports = [
    aider
    codex
  ];
}
