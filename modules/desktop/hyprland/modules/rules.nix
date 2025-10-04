{ ... }:

{
  programs.hyprland.settings.windowrulev2 = [
    "opacity 0.9, class:^(kitty)$"
    "opacity 0.85, class:^(Emacs)$"
    "opacity 1.0, class:^(firefox)$"
  ];
}
