{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ghostty
  ];

  programs.ghostty =  {
    enable = true;
    settings = {
      theme = "Argonaut";
      "font-family" = "JetBrainsMono Nerd Font";
      "font-size" = "12";
      "background-opacity" = "0.7";
      #"background-blur-radius" = "8";
      "window-decoration" = "none";
      "cursor-style" = "block";
      "confirm-close-surface" = "false";
      "window-padding-x" = "6";
      "window-padding-y" = "4";
    };
  };
}
