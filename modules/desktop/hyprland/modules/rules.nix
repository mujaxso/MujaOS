{
  windowrulev2 = [
    "suppressevent maximize, class:.*"
    "opacity 0.8 0.8, class:kitty"
    "opacity 0.8 0.8, class:emacs"
    "opacity 0.8 0.8, class:ghostty"
    #"opacity 0.5 0.5, class:emacs, title:emacs"
    #"opacity 0.90 $& 0.90 $& 1,class:^(brave-browser)$"
    #"float,class:^(kitty)$,title:^(kitty)$"

    "opacity 0.0 override,class:^(xwaylandvideobridge)$"
    "noanim,class:^(xwaylandvideobridge)$"
    "noinitialfocus,class:^(xwaylandvideobridge)$"
    "maxsize 1 1,class:^(xwaylandvideobridge)$"
    "noblur,class:^(xwaylandvideobridge)$"
    "nofocus,class:^(xwaylandvideobridge)$"
  ];
}
