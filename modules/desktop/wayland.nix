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
    libx11
    libxcursor
    libxi
    libxrandr
  ];
}
