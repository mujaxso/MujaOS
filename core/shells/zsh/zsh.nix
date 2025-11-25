{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellInit = ''
      export GTK_THEME="Materia-dark"
      export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc"
      export GTK_DATA_PREFIX="/run/current-system/sw"
      export GTK_PATH="/run/current-system/sw/lib/gtk-2.0"
    '';

    # initExtra = ''
    #   # Load zap plugin manager
    #   if [[ ! -f ~/.local/share/zap/zap.zsh ]]; then
    #     mkdir -p ~/.local/share/zap
    #     curl -fsSL https://zapzsh.org/install.zsh | zsh
    #   fi
    #   source ~/.local/share/zap/zap.zsh
    # '';
  };

  imports = [
    ./modules/aliases.nix
    #./modules/environment.nix
    #./modules/prompt.nix
    #./modules/plugins.nix
    ./modules/completions.nix
    #./modules/keybindings.nix
    #./modules/history.nix
    #./modules/functions.nix
    #./modules/themes.nix
  ];
}
