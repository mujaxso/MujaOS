{ config, pkgs,lib, ... }: {
  
  programs.git = {
    enable = true;
    # userName  = "Mujahid Siyam";
    # userEmail = "mujaxso@proton.me";
    # signing = {
    #   key = "~/.ssh/id_ed25519.pub";
    #   signByDefault = true;
    # };
    # aliases = {
    #   co = "checkout";
    #   br = "branch";
    #   ci = "commit";
    #   st = "status";
    #   lg = "log --oneline --graph --decorate";
    # };

    # extraConfig = {
    #   core.editor = "nvim";
    #   init.defaultBranch = "main";
    #   pull.rebase = false;
    #   commit.gpgSign = true;
    #   gpg.format = "ssh";
    # };

    # includes = [
    #   {
    #     condition = "gitdir:~/Dev/";
    #     contents.user = {
    #       email = "personal@email.com";
    #       name = "My Name";
    #     };
    #   }
    #   {
    #     condition = "gitdir:~/Work/";
    #     contents.user = {
    #       email = "work@email.com";
    #       name = "My Name";
    #     };
    #   }
    # ];
  };
}

