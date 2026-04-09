{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    wayland
    wayland-protocols
    libxkbcommon
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr
  ];
}
