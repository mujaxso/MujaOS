{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    lua
    stylua
  ];
}
