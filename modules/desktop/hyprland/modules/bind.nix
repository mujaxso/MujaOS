{mkLuaInline}: let
  k = s: mkLuaInline ''mainMod .. " + ${s}"'';
  nk = s: mkLuaInline ''"${s}"'';
  sk = s: mkLuaInline ''"${s}"'';

  exec = c: mkLuaInline ''hl.dsp.exec_cmd("${c}")'';
  close = mkLuaInline "hl.dsp.window.close()";
  fullscreen = mkLuaInline "hl.dsp.window.fullscreen()";
  togglefloat = mkLuaInline ''hl.dsp.window.float({ action = "toggle" })'';
  togglepseudo = mkLuaInline "hl.dsp.window.pseudo()";
  togglesplit = mkLuaInline ''hl.dsp.layout("togglesplit")'';
  exithl = mkLuaInline "hl.dsp.exit()";
  cyclenext = mkLuaInline "hl.dsp.window.cycle_next()";
  bringtop = mkLuaInline "hl.dsp.window.bring_to_top()";
  workspace = n: mkLuaInline ''hl.dsp.focus({ workspace = "${n}" })'';
  movetows = n: mkLuaInline ''hl.dsp.window.move({ workspace = "${n}" })'';
  focus = d: mkLuaInline ''hl.dsp.focus({ direction = "${d}" })'';
  movewin = d: mkLuaInline ''hl.dsp.window.move({ direction = "${d}" })'';
  swapwin = d: mkLuaInline ''hl.dsp.window.swap({ direction = "${d}" })'';
  resize = x: y: mkLuaInline ''hl.dsp.window.resize({ x = ${toString x}, y = ${toString y}, relative = true })'';
  wsopt = o: mkLuaInline ''hl.dsp.global("${o}")'';
  drag = mkLuaInline "hl.dsp.window.drag()";
  mouseresize = mkLuaInline "hl.dsp.window.resize()";

  entry = keycombo: dispatch: { _args = [ keycombo dispatch ]; };
  entryRepeat = keycombo: dispatch: { _args = [ keycombo dispatch { repeating = true; } ]; };
in [
  (entry (k "RETURN") (exec "ghostty"))
  (entry (k "K") (exec "list-keybinds"))
  (entry (k "R") (exec "rofi-launcher"))
  (entry (k "SPACE") (exec "rofi -show drun"))
  (entry (k "SHIFT + W") (exec "web-search"))
  (entry (k "ALT + W") (exec "wallsetter"))
  (entry (k "SHIFT + N") (exec "swaync-client -rs"))
  (entry (k "Y") (exec "ghostty -e yazi"))
  (entry (k "E") (exec "emopicker9000"))
  (entry (k "S") (exec "screenshootin"))
  (entry (k "D") (exec "discord"))
  (entry (k "O") (exec "obs"))
  (entry (k "C") (exec "hyprpicker -a"))
  (entry (k "G") (exec "gimp"))
  (entry (k "SHIFT + T") (exec "pypr toggle term"))
  (entry (k "T") (exec "thunar"))
  (entry (k "M") (exec "pavucontrol"))
  (entry (k "V") (exec "cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
  (entry (k "C") close)
  (entry (k "P") togglepseudo)
  (entry (k "SHIFT + I") togglesplit)
  (entry (k "F") fullscreen)
  (entry (k "SHIFT + F") togglefloat)
  (entry (k "ALT + F") (wsopt "allfloat"))
  (entry (k "SHIFT + C") exithl)
  (entryRepeat (k "SHIFT + RIGHT") (resize 10 0))
  (entryRepeat (k "SHIFT + LEFT") (resize (-10) 0))
  (entryRepeat (k "SHIFT + UP") (resize 0 (-10)))
  (entryRepeat (k "SHIFT + DOWN") (resize 0 10))
  (entry (k "SHIFT + H") (movewin "left"))
  (entry (k "SHIFT + L") (movewin "right"))
  (entry (k "SHIFT + K") (movewin "up"))
  (entry (k "SHIFT + J") (movewin "down"))
  (entry (k "ALT + LEFT") (swapwin "left"))
  (entry (k "ALT + RIGHT") (swapwin "right"))
  (entry (k "ALT + UP") (swapwin "up"))
  (entry (k "ALT + DOWN") (swapwin "down"))
  (entry (k "LEFT") (focus "left"))
  (entry (k "RIGHT") (focus "right"))
  (entry (k "UP") (focus "up"))
  (entry (k "DOWN") (focus "down"))
  (entry (k "H") (focus "left"))
  (entry (k "L") (focus "right"))
  (entry (k "K") (focus "up"))
  (entry (k "J") (focus "down"))
  (entry (k "1") (workspace "1"))
  (entry (k "2") (workspace "2"))
  (entry (k "3") (workspace "3"))
  (entry (k "4") (workspace "4"))
  (entry (k "5") (workspace "5"))
  (entry (k "6") (workspace "6"))
  (entry (k "7") (workspace "7"))
  (entry (k "8") (workspace "8"))
  (entry (k "9") (workspace "9"))
  (entry (k "0") (workspace "10"))
  (entry (k "SHIFT + 1") (movetows "1"))
  (entry (k "SHIFT + 2") (movetows "2"))
  (entry (k "SHIFT + 3") (movetows "3"))
  (entry (k "SHIFT + 4") (movetows "4"))
  (entry (k "SHIFT + 5") (movetows "5"))
  (entry (k "SHIFT + 6") (movetows "6"))
  (entry (k "SHIFT + 7") (movetows "7"))
  (entry (k "SHIFT + 8") (movetows "8"))
  (entry (k "SHIFT + 9") (movetows "9"))
  (entry (k "SHIFT + 0") (movetows "10"))
  (entry (k "CONTROL + RIGHT") (workspace "e+1"))
  (entry (k "CONTROL + LEFT") (workspace "e-1"))
  (entry (k "mouse_down") (workspace "e+1"))
  (entry (k "mouse_up") (workspace "e-1"))
  (entry (nk "ALT + TAB") cyclenext)
  (entry (nk "ALT + TAB") bringtop)
  (entry (sk "XF86AudioRaiseVolume") (exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
  (entry (sk "XF86AudioLowerVolume") (exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
  (entry (sk "XF86AudioMute") (exec "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
  (entry (sk "XF86AudioPlay") (exec "playerctl play-pause"))
  (entry (sk "XF86AudioPause") (exec "playerctl play-pause"))
  (entry (sk "XF86AudioNext") (exec "playerctl next"))
  (entry (sk "XF86AudioPrev") (exec "playerctl previous"))
  (entry (sk "XF86MonBrightnessDown") (exec "brightnessctl set 5%-"))
  (entry (sk "XF86MonBrightnessUp") (exec "brightnessctl set +5%"))
  (entry (sk "PRINT") (exec "grimblast copysave area ~/Images/screenshots/screenshot_$(date +%Y%m%d_%H%M%S).png"))
  (entry (k "SHIFT + PRINT") (exec "grimblast copysave output ~/Images/screenshots/screenshot_$(date +%Y%m%d_%H%M%S).png"))
  {
    _args = [
      (k "mouse:272")
      drag
      { mouse = true; }
    ];
  }
  {
    _args = [
      (k "mouse:273")
      mouseresize
      { mouse = true; }
    ];
  }
]
