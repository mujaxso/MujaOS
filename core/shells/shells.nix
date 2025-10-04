{ config, pkgs, ... }:

{
  imports = [
    ./zsh/zsh.nix
    ./starship.nix
  ];

}
