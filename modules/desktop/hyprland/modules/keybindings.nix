{ ... }:

{
  programs.hyprland.settings.bind = [
    "SUPER,Return,exec,kitty"
    "SUPER,E,exec,emacs"
    "SUPER,F,exec,firefox"
    "SUPER,D,exec,rofi -show drun"
    "SUPER,Q,killactive"
    "SUPER,Space,togglefloating"
    "SUPER,L,exec,swaylock"
    "SUPER,R,exec,hyprctl reload"
    "SUPER,1,workspace,1"
    "SUPER,2,workspace,2"
    "SUPER,3,workspace,3"
    "SUPER,4,workspace,4"
    "SUPER,5,workspace,5"
    "SUPER+Shift,1,movetoworkspace,1"
    "SUPER+Shift,2,movetoworkspace,2"
    "SUPER+Shift,3,movetoworkspace,3"
    "SUPER+Shift,4,movetoworkspace,4"
    "SUPER+Shift,5,movetoworkspace,5"
  ];
}
