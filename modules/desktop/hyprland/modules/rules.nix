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

    # 1. FORCE ALL POPUPS TO FLOAT
    # If a REAPER window is NOT the main window, float it.
    "float,class:^(REAPER)$,title:^(?!.*REAPER v.*$)"

    # 2. SPECIFIC FIX FOR BRIDGED PLUGINS (e.g., Windows plugins via Yabridge)
    # These often run as "reaper_bridge" or "wine"
    "float,class:^(reaper_bridge)$"
    "float,class:^(wine)$"

    # 3. Force resizing on those floating windows
    "plugin:force_floating,class:^(REAPER)$" # If using hyprland plugins

    # 4. Fallback: If title matches "FX", definitely float
    "float,class:^(REAPER)$,title:^(FX:.*)$"
    "float,class:^(reaper_bridge)$"
    "float,class:^(wine)$"
  ];
}
