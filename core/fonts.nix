{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.hack
      nerd-fonts.roboto-mono
      nerd-fonts.droid-sans-mono
      nerd-fonts.ubuntu
      nerd-fonts.dejavu-sans-mono
      #nerd-fonts.source-code-pro
      nerd-fonts.iosevka
      nerd-fonts.meslo-lg
      #nerd-fonts.cascadia-code
      nerd-fonts.victor-mono
      # ... and more
    ];
  };
}
