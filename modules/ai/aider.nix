{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    aider-chat
  ];

}
