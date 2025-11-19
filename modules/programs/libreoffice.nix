{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    libreoffice-fresh

    # Spell-checking dictionaries
    hunspellDicts.en-us
    hunspellDicts.fr-moderne

    # Arabic fonts (available in nixpkgs)
    amiri
    scheherazade-new
  ];
}
