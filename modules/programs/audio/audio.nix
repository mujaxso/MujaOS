{
  config,
  pkgs,
  ...
}: let
  daw = ./daw.nix;
  reaper = ./reaper.nix;
in {
  imports = [
    daw
    reaper
  ];
}
