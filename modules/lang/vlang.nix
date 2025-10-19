{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    vlang
  ];
}
