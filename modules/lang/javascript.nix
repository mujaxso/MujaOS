{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    javascript-typescript-langserver
    typescript-language-server
    nodePackages.prettier
    biome
  ];
}
