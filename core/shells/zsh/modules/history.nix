{ ... }:
{
  programs.zsh.history = {
    save = 10000;
    size = 10000;
    path = "$HOME/.zsh_history";
    share = true;
  };
}