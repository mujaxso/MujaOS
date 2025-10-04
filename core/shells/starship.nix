{ config, pkgs, ... }:
{
  programs.starship = {
    enable = true;
    # Optional: custom settings
    settings = {
      add_newline = true;
      command_timeout = 1000;

      # format = "$username@$hostname $directory $git_branch $character";
      
      format = "$directory$nix_shell$git_branch$git_commit$git_state$git_status$jobs$cmd_duration$character";

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };
      
      shlvl = {
        disabled = false;
        symbol = "ﰬ";
        style = "bright-red bold";
      };

      shell = {
        disabled = false;
        format = "$indicator";
        fish_indicator = "";
        bash_indicator = "[BASH](bright-white) ";
        zsh_indicator = "[ZSH](bright-white) ";
      };

      username = {
        style_user = "bright-white bold";
        style_root = "bright-red bold";
      };

      hostname = {
        style = "bright-green bold";
        ssh_only = true;
      };

      nix_shell = {
        symbol = "";
        format = "[$symbol$name]($style) ";
        style = "bright-purple bold";
      };

      git_branch = {
        only_attached = true;
        format = "[$symbol$branch]($style) ";
        symbol = "";
        style = "bright-yellow bold";
      };

      git_commit = {
        only_detached = true;
        format = "[ﰖ$hash]($style) ";
        style = "bright-yellow bold";
      };

      git_state = {
        style = "bright-purple bold";
      };

      git_status = {
        style = "bright-green bold";
      };

      directory = {
        read_only = " ";
        truncation_length = 0;
      };

      cmd_duration = {
        format = "[$duration]($style) ";
        style = "bright-blue";
      };

      jobs = {
        style = "bright-green bold";
      }; 
    };
  };

}
