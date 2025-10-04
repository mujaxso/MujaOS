{ ... }:
{
  programs.zsh.initExtra = ''
    bindkey "^R" history-incremental-search-backward
    bindkey "^A" beginning-of-line
    bindkey "^E" end-of-line
    bindkey "^K" kill-line
    bindkey "^U" backward-kill-line
  '';
}