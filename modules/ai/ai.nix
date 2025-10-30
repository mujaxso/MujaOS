{
  config,
  pkgs,
  ...
}: let
  # define each imported module
  aider = ./aider.nix;
  codex = ./codex.nix;
  gemini = ./gemini.nix;
  claude = ./claude.nix;
in {
  imports = [
    aider
    codex
    gemini
    claude
  ];
}
