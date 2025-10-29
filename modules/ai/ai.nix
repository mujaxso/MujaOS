{
  config,
  pkgs,
  ...
}: let
  # define each imported module
  aider = ./aider.nix;
  codex = ./codex.nix;
  gemini = ./gemini.nix;
in {
  imports = [
    aider
    codex
    gemini
  ];
}
