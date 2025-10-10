{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        ms-python.python
        ms-vscode.cpptools
        rust-lang.rust-analyzer
        bbenoist.nix
        pkief.material-icon-theme
      ];

      userSettings = {
        "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
        "editor.fontSize" = 14;
        "editor.tabSize" = 4;
        "files.autoSave" = "onFocusChange";
        "workbench.iconTheme" = "material-icon-theme";
      };
    };
  };
}
