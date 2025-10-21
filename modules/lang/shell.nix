{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    shfmt
    bash-language-server
  ];
}
