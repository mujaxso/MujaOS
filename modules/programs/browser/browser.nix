{ config, pkgs, ... }:

{
  imports = [
    ./brave.nix
    ./brave-extra.nix
  ];

}
