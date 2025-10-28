{
  config,
  pkgs,
  ...
}: {
  users.users.mujaxso = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "audio" "video" "input" "kvm" "libvirtd"];
    shell = pkgs.zsh;
  };
}
