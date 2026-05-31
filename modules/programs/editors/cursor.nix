{
  config,
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = [
    pkgs-unstable.code-cursor
  ];
}
