{
  config,
  pkgs,
  ...
}: let
  # define each imported module
  aider = ./aider.nix;
  opencode = ./opencode.nix;
  codex = ./codex.nix;
  gemini = ./gemini.nix;
  claude = ./claude.nix;
in {
  imports = [
    aider
    opencode
    codex
    gemini
    claude
  ];
}
