{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.brave = {
    enable = true;
    adblock.enable = true;
    darkMode = true;
    extensions = [
      "chphlpgkkbolifaimnlloiipkdnihall" # OneTab
    ];
  };
}
