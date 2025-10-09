{ pkgs, ...}: {

  programs.light = {
    enable = true;
  };
  # home.packages = with pkgs; [ light ];
}
