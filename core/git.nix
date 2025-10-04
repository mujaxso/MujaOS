{
  email,
  username,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "${username}";
    userEmail = "${email}";
    signing = {
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
    extraConfig = {
      init.defaultBranch = "main";
      commit.gpgSign = true;
      gpg.format = "ssh";
    };
  };
}
