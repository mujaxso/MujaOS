{pkgs, ...}: let
  dmenu = pkgs.dmenu.overrideAttrs (_: {
    src = pkgs.fetchFromGitHub {
      owner = "mujaxso";
      repo = "dmenu";
      rev = "8b48986f4c730725367e2865e5ea24931855018f";
      hash = "";
    };
    # patches = [ ./patches/whatever.diff ];
  });
in {
  home.packages = [dmenu];

  xdg.desktopEntries.dmenu = {
    name = "dmenu";
    genericName = "Dynamic menu";
    comment = "Run commands with dmenu";
    exec = "${dmenu}/bin/dmenu_run";
    terminal = false;
    categories = ["Utility"];
    icon = "system-run";
  };
}
