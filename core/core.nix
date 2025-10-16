{ config, pkgs, ... }:

let
  shells = ./shells/shells.nix;
  fonts = ./fonts.nix;
  users = ./users.nix;
  nix = ./nix.nix;
  services = ./services.nix;
in
{
  imports = [
    shells
    fonts
    users
    nix
    services
  ];
}
