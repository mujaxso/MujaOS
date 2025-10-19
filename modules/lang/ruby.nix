{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    ruby
    rubocop
  ];
}
