{mkLuaInline}: let
  k = s: mkLuaInline ''mainMod .. " + ${s}"'';
  moveunder = mkLuaInline "hl.dsp.window.move_under_cursor()";
  resizeunder = mkLuaInline "hl.dsp.window.resize_under_cursor()";
in [
  { _args = [ (k "MOUSE:272") moveunder ]; }
  { _args = [ (k "MOUSE:273") resizeunder ]; }
]
