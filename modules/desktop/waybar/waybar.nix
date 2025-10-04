{ pkgs, modulesEnabled ? {
    cpu = true; memory = true; disk = true; network = true;
    battery = true; volume = true; brightness = true;
    clock = true; workspaces = true; weather = true;
  }
}:
let
  waybarModulesDir = ./modules;
  allModules = builtins.listToAttrs (builtins.map (file: {
    name = builtins.basename (builtins.removeSuffix ".nix" file);
    value = import (waybarModulesDir + "/" + file) { inherit pkgs; };
  }) (builtins.filter (f: f != "." && f != "..") (builtins.readDir waybarModulesDir)));
  activeModules = builtins.filterAttrs (name: _: builtins.getAttrDefault false name modulesEnabled) allModules;
in
{
  programs.waybar = {
    enable = true;
    config = let
      moduleAttrs = activeModules;
      modulesLeft = builtins.filter (name: builtins.elem name ["workspaces" "clock"]) (builtins.attrNames moduleAttrs);
      modulesCenter = builtins.filter (name: builtins.elem name ["cpu" "memory" "disk" "network"]) (builtins.attrNames moduleAttrs);
      modulesRight = builtins.filter (name: builtins.elem name ["volume" "brightness" "battery" "weather"]) (builtins.attrNames moduleAttrs);
    in
    {
      layer = "top";
      position = "top";
      modules-left = modulesLeft;
      modules-center = modulesCenter;
      modules-right = modulesRight;
      inherit moduleAttrs;
    };
    style = builtins.readFile ./style.css;
  };
}