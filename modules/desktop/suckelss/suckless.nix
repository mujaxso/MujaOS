{ pkgs, ...}:

let
  dwm = ./dwm.nix;
  st = ./st.nix;
  dwmblocks = ./dwmblocks.nix;
in
{
  imports = [
    dwm
    # st
    dwmblocks
  ];

}
