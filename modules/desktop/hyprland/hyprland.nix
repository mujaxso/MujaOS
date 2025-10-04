{ config, pkgs, ... }:

let
  hyprModules = [
    ./modules/appearance.nix
    ./modules/animations.nix
    ./modules/keybindings.nix
    ./modules/rules.nix
    ./modules/workspaces.nix
    ./modules/monitors.nix
    #./modules/input.nix
    #./modules/autostart.nix
  ];
in
{
  imports = hyprModules;

  programs.hyprland = {
    enable = true;
    package = pkgs.unstable.hyprland;
    withUWSM = true;
    xwayland.enable = true;
  };

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "hyprland";

  environment.systemPackages = with pkgs; [
    hyprpaper
    dunst
    mako
    kitty
    rofi
    grim
    slurp
    wl-clipboard
  ];
}
