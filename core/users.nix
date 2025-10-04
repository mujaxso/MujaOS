{ config, pkgs, ... }:

{
  users.users.mujaxso = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };
}