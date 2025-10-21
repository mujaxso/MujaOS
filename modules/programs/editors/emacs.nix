{pkgs, ...}: {
  # Install mu (includes mu4e)
  home.packages = with pkgs; [
    mu
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };
}
