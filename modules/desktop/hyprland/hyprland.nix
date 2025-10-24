{
  config,
  pkgs,
  ...
}: let
  modulesDir = ./modules;

  packages = import (modulesDir + "/packages.nix") {inherit pkgs;};
  bindings = import (modulesDir + "/bindings.nix");
  input = import (modulesDir + "/input.nix");
  general = import (modulesDir + "/general.nix");
  env = import (modulesDir + "/env.nix");
  animations = import (modulesDir + "/animations.nix");
  decoration = import (modulesDir + "/decoration.nix");
  dwindle = import (modulesDir + "/dwindle.nix");
  misc = import (modulesDir + "/misc.nix");
  autostart = import (modulesDir + "/autostart.nix");
  monitor = import (modulesDir + "/monitor.nix");
  rules = import (modulesDir + "/rules.nix");
  layerrule = import (modulesDir + "/layerrule.nix");
in {
  home.packages = packages;

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    extraConfig = ''
      exec-once = hyprland --config /etc/hypr/hyprland.conf
    '';
    settings = {
      monitor = monitor;
      exec-once = autostart;
      inherit (bindings) bind bindm;
      input = input;
      general = general;
      env = env;
      animations = animations;
      decoration = decoration;
      dwindle = dwindle;
      misc = misc;
      rules = rules;
      layerrule = layerrule;
    };
  };
}
