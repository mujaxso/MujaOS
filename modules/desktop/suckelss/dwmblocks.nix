{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    (pkgs.stdenv.mkDerivation {
      pname = "dwmblocks";
      version = "1.0";

      src = pkgs.fetchFromGitHub {
        owner = "mujaxso";
        repo = "dwmblocks";
        rev = "main";
        hash = "sha256-u94wXumfZQinK7JHAs9tIUMcrn50pTpv5xGL5hhAOqE=";
      };

      buildInputs = [pkgs.libx11];

      postPatch = ''
        substituteInPlace dwmblocks.c \
          --replace-fail "void termhandler()" "void termhandler(int sig)"
      '';

      makeFlags = ["PREFIX=$(out)"];

      meta = {
        description = "Modular status bar for dwm";
        mainProgram = "dwmblocks";
      };
    })
  ];
}
