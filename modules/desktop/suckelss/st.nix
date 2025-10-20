{pkgs, ...}: let
  st = pkgs.st.overrideAttrs (_: {
    src = pkgs.fetchFromGitHub {
      owner = "mujaxso";
      repo = "st";
      rev = "eed8b180f8f322a547f8a60bf8b60a28c5ccbb5f";
      hash = "sha256-2FCNcBR6HQgt9m2Lc9Ag1BCg3d1Px/drZq6L8Lq+5dY=";
    };
    # optional patches = [ ./patches/some.patch ];
  });
in {
  home.packages = [st];

  xdg.desktopEntries.st = {
    name = "st";
    genericName = "Simple Terminal";
    comment = "Suckless terminal emulator";
    exec = "${st}/bin/st";
    terminal = false;
    categories = ["System" "TerminalEmulator"];
    icon = "utilities-terminal";
  };
}
