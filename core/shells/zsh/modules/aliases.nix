{ ... }:
{
  programs.zsh.shellAliases = {
    ls = "ls --color=auto";
    ll = "ls -lah";
    la = "ls -A";
    grep = "grep --color=auto";
    #.. = "cd ..";
    #... = "cd ../..";
    gs = "git status";
    gc = "git commit";
    gp = "git push";
    gpl = "git pull";
    v = "nvim";
    h = "history";
  };
}
