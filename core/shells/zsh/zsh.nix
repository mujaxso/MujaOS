{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellInit = ''
      export PATH="$HOME/.local/bin:$PATH"
      export GTK_THEME="Materia-dark"
      export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc"
      export GTK_DATA_PREFIX="/run/current-system/sw"
      export GTK_PATH="/run/current-system/sw/lib/gtk-2.0"

      # Opencode env vars
      export OPENCODE_DISABLE_DEFAULT_PLUGINS="1"
      export OPENCODE_DISABLE_MODELS_FETCH="1"
      export OPENCODE_DISABLE_LSP_DOWNLOAD="1"
      export OPENCODE_EXPERIMENTAL_DISABLE_FILEWATCHER="1"
      export OPENCODE_EXPERIMENTAL_BASH_DEFAULT_TIMEOUT_MS="1800000"
      export OPENCODE_EXPERIMENTAL_CONTEXT_WINDOW="1000000"
      export OPENCODE_EXPERIMENTAL_OUTPUT_TOKEN_MAX="32000"

      # Completion cache
      zstyle ':completion:*' use-cache on
      zstyle ':completion:*' cache-path "$HOME/.zsh/cache"
      zstyle ':completion:*:*:git:*' script /dev/null

      # History
      HISTFILE="$HOME/.zsh_history"
      HISTSIZE=10000
      SAVEHIST=10000
      setopt HIST_IGNORE_DUPS
      setopt HIST_IGNORE_SPACE
      setopt SHARE_HISTORY
      setopt HIST_REDUCE_BLANKS
      skip_global_compinit=1
    '';
  };

  imports = [
    ./modules/aliases.nix
    # ./modules/environment.nix
    # ./modules/prompt.nix
    # ./modules/plugins.nix
    ./modules/completions.nix
    # ./modules/keybindings.nix
    # ./modules/history.nix
    # ./modules/functions.nix
    # ./modules/themes.nix
  ];
}
