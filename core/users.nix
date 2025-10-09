{ config, pkgs, ... }:

{
  users.users.mujaxso = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" ];
    shell = pkgs.zsh;
  };
}
