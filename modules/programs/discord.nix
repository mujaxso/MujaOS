{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.discord
  ];
}
