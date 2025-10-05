{ pkgs, ...}:
{
  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };

  home.packages = with pkgs; [
    bibata-cursors
  ];
}
