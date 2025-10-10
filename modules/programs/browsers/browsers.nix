{ pkgs, ...}:
let
  brave = ./brave.nix;
  brave-extra = ./brave-extra.nix;
  in
{
  imports = [
    brave
    brave-extra
  ];
}
