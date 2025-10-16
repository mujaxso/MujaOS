{ config, pkgs, ... }:

let
  myDwm = pkgs.dwm.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "mujaxso";
      repo = "dwm";
      rev = "b7369d6c22585df39944fceb605b95fb0ca40ec3";  # Replace with actual commit hash, not "main"
      hash = "sha256-EBMxjhmbFORGG57ud4He8vbbsaa9xAG0lUqUTdxly5E=";
    };
  });
in
{
  home.packages = [ myDwm ];
  
  xsession = {
    enable = true;
    windowManager.command = "${myDwm}/bin/dwm";
  };
}
