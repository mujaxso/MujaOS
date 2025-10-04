{ ... }:
{
  programs.zsh.initExtra = ''
    # Example Zap plugins
    zap install zsh-users/zsh-autosuggestions
    zap install zsh-users/zsh-syntax-highlighting
    zap install zsh-users/zsh-completions
  '';
}