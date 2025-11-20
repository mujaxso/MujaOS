{
  config,
  pkgs,
  ...
}: let
  shells = ./shells/shells.nix;
  fonts = ./fonts.nix;
  users = ./users.nix;
  nix = ./nix.nix;
  services = ./services.nix;
  security = ./security.nix;
  systemd = ./systemd.nix;
  networking = ./networking.nix;
  audio = ./audio.nix;
  virtualisation = ./virtualization.nix;
  flatpak = ./flatpak.nix;
in {
  imports = [
    shells
    fonts
    users
    nix
    services
    security
    systemd
    networking
    #audio
    virtualisation
    flatpak
  ];
}
