{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    qt6ct
    kdePackages.qtstyleplugin-kvantum
    kdePackages.breeze
    kdePackages.breeze-icons
  ];

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = lib.mkForce "qt6ct";
    QT_STYLE_OVERRIDE = lib.mkForce "kvantum";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  };

  xdg.configFile."qt6ct/qt6ct.conf".text = ''
    [Appearance]
    color_scheme_path=${pkgs.kdePackages.breeze}/share/color-schemes/BreezeDark.colors
    custom_palette=false
    icon_theme=breeze-dark
    style=kvantum-dark

    [Fonts]
    fixed="Monospace,10,-1,5,50,0,0,0,0,0"
    general="Sans Serif,10,-1,5,50,0,0,0,0,0"

    [Interface]
    activate_item_on_single_click=1
    buttonbox_layout=0
    cursor_flash_time=1000
    dialog_buttons_have_icons=1
    double_click_interval=400
    gui_effects=@Invalid()
    keyboard_scheme=2
    menus_have_icons=true
    show_shortcuts_in_context_menus=true
    stylesheets=@Invalid()
    toolbutton_style=4
    underline_shortcut=1
    wheel_scroll_lines=3
  '';

  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=KvArcDark
  '';

  xdg.configFile."Kvantum/KvArcDark.kvconfig".text = ''
    [General]
    author=Vince Liuice
    comment=Arc inspired KvAntum theme
    x11drag=true
    left_tabs=false
    attach_active_tab=true
    close_buttons_on_hover=false

    [PanelButtonCommand]
    frame=true
    frame_width=2
    frame_type=raised
    interior=true
    interior_press=flat

    [Hacks]
    transparent_menutitle=false
    transparent_menuitem=true
    transparent_arrow=true
    left_tabs=false

    [Scrollbar]
    transient=true
  '';
}
