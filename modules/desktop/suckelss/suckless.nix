{pkgs, ...}: let
  dwm = ./dwm.nix;
  dmenu = ./dmenu.nix;
  st = ./st.nix;
  dwmblocks = ./dwmblocks.nix;
in {
  imports = [
    dwm
    dmenu
    st
    dwmblocks
  ];
}
