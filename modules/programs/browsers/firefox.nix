{
  config,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    configPath = ".mozilla/firefox";
  };
}
