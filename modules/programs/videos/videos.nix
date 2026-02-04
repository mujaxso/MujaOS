{
  config,
  pkgs,
  ...
}: let
  ffmpeg = ./ffmpeg.nix;
  obs = ./obs.nix;
  davinci-resolve = ./davinci-resolve.nix;
  kdenlive = ./kdenlive.nix;
  mpv = ./mpv.nix;
in {
  imports = [
    ffmpeg
    obs
    davinci-resolve
    # kdenlive
    mpv
  ];
}
