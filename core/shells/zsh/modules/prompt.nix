{ ... }:
{
  programs.zsh.promptInit = ''
    autoload -U promptinit; promptinit
    prompt pure
  '';
}