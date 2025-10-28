{
  config,
  pkgs,
  lib,
  ...
}: {
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      swtpm.enable = true;
      runAsRoot = true;
    };
    onBoot = "start";
    onShutdown = "shutdown";
  };

  virtualisation.spiceUSBRedirection.enable = true;

  # Enable dconf for virt-manager settings
  programs.dconf.enable = true;

  # Or use the virt-manager program module which enables dconf automatically
  programs.virt-manager.enable = true;

  boot.kernelModules = ["kvm" "kvm_intel" "kvm_amd"]; # Use kvm_amd for AMD

  environment.systemPackages = with pkgs; [
    qemu
    swtpm
    virt-manager
    virt-viewer
  ];
}
