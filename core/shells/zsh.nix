{ config, pkgs, ... }:

{
  system.userActivationScripts.zshrc = "touch .zshrc";
  
  programs.zsh = {
    enable = true;

    # Make Zsh the default shell for all users
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
    histSize = 10000;
    histFile = "$HOME/.zsh_history";
    setOptions = [ "HIST_IGNORE_ALL_DUPS" ];
    dotDir = ".config/zsh";
    # promptInit = ''
    #   # Use powerlevel10k if installed
    #   if [ -f ${pkgs.zsh-powerlevel10k}/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]; then
    #     source ${pkgs.zsh-powerlevel10k}/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
    #   fi
    #   [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
    # '';

    shellAliases = {
      # File management
      ls = "ls --color=auto";
      ll = "ls -lh";
      la = "ls -lah";
      grep = "grep --color=auto";

      # NixOS shortcuts
      rebuild = "sudo nixos-rebuild switch";
      rebuild-up = "sudo nixos-rebuild switch --upgrade";
      editconfig = "sudo nano /etc/nixos/configuration.nix";
      flake-rebuild = "sudo nixos-rebuild switch --flake /etc/nixos";

      # Git shortcuts
      gs = "git status";
      ga = "git add";
      gc = "git commit -m";
      gp = "git push";
      gl = "git log --oneline --graph --decorate";
    };
  };

  environment.systemPackages = with pkgs; [
    zsh
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-completions
    zsh-powerlevel10k
  ];
}
