{ config, pkgs,lib, ... }: {

  home.packages = with pkgs; [
    lazygit
  ];
  
  programs.git = {
    enable = true;
    userName  = "Mujahid Siyam";
    userEmail = "mujaxso@proton.me";
    signing = {
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
    aliases = {
      co = "checkout";
      br = "branch";
      ci = "commit";
      st = "status";
      lg = "log --oneline --graph --decorate";
    };

    extraConfig = {
      core.editor = "nvim";
      init.defaultBranch = "main";
      pull.rebase = false;
      commit.gpgSign = true;
      gpg.format = "ssh";
    };

    includes = [
      {
        condition = "gitdir:~/Dev/";
        contents.user = {
          email = "mujaxso@gmail.com";
          name = "Mujahid Siyam";
        };
      }
      {
        condition = "gitdir:~/Work/";
        contents.user = {
          email = "mujaxso@proton.me";
          name = "Mujahid Mohamed Ismail";
        };
      }
    ];
  };
}

