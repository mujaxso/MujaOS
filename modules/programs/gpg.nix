{pkgs, ...}: {
  # Modern GPG/agent configuration path in Home Manager
  programs.gpg = {
    enable = true;
    agent = {
      enable = true;
      enableSshSupport = false; # set true only if you want gpg-agent to act as SSH agent
      defaultCacheTtl = 3600;
      maxCacheTtl = 7200;
    };
  };
}
