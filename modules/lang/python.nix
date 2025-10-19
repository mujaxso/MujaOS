{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    python314
    black
    ruff
  ];
}
