{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    lazygit
  ];
  # Declaratively create allowed signers for SSH verification.
  # Replace principal if you prefer a specific email per key.
  # xdg.configFile."git/allowed_signers".text = "mujaxso@proton.me ${builtins.readFile ~/.ssh/id_ed25519.pub}";
  xdg.configFile."git/allowed_signers".source = ../../secrets/allowed_signers;

  programs.git = {
    enable = true;
    userName = "Mujahid Siyam";
    userEmail = "mujaxso@proton.me";

    # Do not set signing.key here for SSH; that option is for GPG keys.
    signing = {
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

      # SSH signing
      gpg.format = "ssh";
      commit.gpgSign = true;
      tag.gpgSign = true;

      # Point to your SSH public key for signing
      user.signingkey = "~/.ssh/id_ed25519.pub";

      # Required for verification of SSH signatures
      gpg.ssh.allowedSignersFile = "${config.xdg.configHome}/git/allowed_signers";

      # Optional: always show signatures in logs
      log.showSignature = true;
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
