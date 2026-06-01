{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;

  modulesDir = ./modules;
in {
  home.packages = import (modulesDir + "/packages.nix") {inherit pkgs;};

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    xwayland.enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;

    settings = {
      # Variable
      mainMod = { _var = "SUPER"; };

      # Categories go in config
      config = {
        general = import (modulesDir + "/general.nix");
        decoration = import (modulesDir + "/decoration.nix");
        input = import (modulesDir + "/input.nix");
        misc = import (modulesDir + "/misc.nix");
        dwindle = import (modulesDir + "/dwindle.nix");
      };

      # Monitor
      monitor = import (modulesDir + "/monitor.nix");

      # Environment
      env = import (modulesDir + "/env.nix");

      # Animations
      curve = import (modulesDir + "/bezier.nix");
      animation = import (modulesDir + "/animations.nix");

      # Keybindings
      bind = import (modulesDir + "/bind.nix") {inherit mkLuaInline;};

      # Window and layer rules
      window_rule = import (modulesDir + "/rules.nix");
      layer_rule = import (modulesDir + "/layerrule.nix");

      # Startup commands via hl.on
      on = import (modulesDir + "/startup.nix") {inherit mkLuaInline;};
    };
  };
}
