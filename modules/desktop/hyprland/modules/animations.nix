{ ... }:

{
  programs.hyprland.settings.animations = {
    enabled = true;
    bezier = [ "ease,0.25,0.1,0.25,1.0" ];
    animation = [
      "windows,1,7,default"
      "border,1,10,default"
      "fade,1,7,default"
      "workspaces,1,6,default"
    ];
  };
}
