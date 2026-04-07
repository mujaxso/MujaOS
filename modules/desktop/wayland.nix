{
  config,
  pkgs,
  lib,
  ...
}: {
  # home.packages = with pkgs; [
  #   wayland
  #   libxkbcommon
  #   libGL
  # ];

  # home.sessionVariables.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
  #   pkgs.wayland
  #   pkgs.libxkbcommon
  #   pkgs.libGL
  # ];

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

  environment.sessionVariables.LD_LIBRARY_PATH = lib.mkForce (
    [
      "/run/current-system/sw/lib"
    ]
    ++ (config.environment.sessionVariables.LD_LIBRARY_PATH or [])
  );
}
