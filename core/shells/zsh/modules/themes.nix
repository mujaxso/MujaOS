{ ... }:
{
  programs.zsh.initExtra = ''
    # Simple theme
    PROMPT='%F{cyan}%n@%m%f %F{yellow}%~%f %# '
  '';
}