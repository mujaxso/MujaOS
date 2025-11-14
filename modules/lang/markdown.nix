{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pandoc
    python313Packages.grip
  ];
}
