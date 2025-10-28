{
  config,
  pkgs,
  ...
}: let
  # define each imported module
  libvirt = ./libvirt.nix;
in {
  imports = [
    libvirt
  ];
}
