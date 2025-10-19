{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    javascript-typescript-langserver
    nodePackages.prettier
    biome
  ];
}
