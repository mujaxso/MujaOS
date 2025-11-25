{pkgs, ...}: {
  home.packages = with pkgs; [
    # Wrap REAPER to FORCE the dark theme file
    (symlinkJoin {
      name = "reaper";
      paths = [reaper];
      buildInputs = [makeWrapper];
      postBuild = ''
        wrapProgram $out/bin/reaper \
          --set SWELL_colortheme "$HOME/.config/REAPER/libSwell.colortheme"
      '';
    })
  ];

  # ---------------------------------------------------------
  # 1. REAPER SWELL THEME (Darkens Menus & Dialogs)
  # ---------------------------------------------------------
  # This file controls the colors of REAPER's "native" Linux menus,
  # file browsers, and popup windows which normally look white/Win98.
  # FORCE the main filename. Dropping '-user' ensures REAPER picks this up
  # as the primary theme definition if it exists in the resource path.
  home.file.".config/REAPER/libSwell.colortheme".text = ''
    # Dark SWELL Theme for REAPER
    # Format is 0xRRGGBB (Hex)

    # Main Backgrounds (Dark Grey)
    col_main_bg 0x202020
    col_main_text 0xE0E0E0

    # MENUS (The fix for light menus)
    col_menu_bg 0x202020
    col_menu_text 0xE0E0E0
    col_menu_shadow 0x000000
    col_menu_hilight 0x404040

    # Dialogs and Windows
    col_3d_face 0x303030
    col_3d_shadow 0x101010
    col_3d_hilight 0x505050
    col_3d_dkgray 0x202020
    col_3d_ltgray 0x606060

    # Buttons
    col_btn_bg 0x303030
    col_btn_text 0xE0E0E0
    col_btn_text_shadow 0x000000

    # Text Editors / Lists
    col_edit_bg 0x101010
    col_edit_text 0xE0E0E0
    col_list_bg 0x101010
    col_list_text 0xE0E0E0

    # Scrollbars
    col_scroll_bg 0x202020
    col_scroll_face 0x404040
    col_scroll_arrow 0x808080
  '';
}
