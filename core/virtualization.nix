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

  # Systemd service to autostart the default network
  systemd.services.libvirt-default-network = {
    description = "Autostart libvirt default network";
    after = ["libvirtd.service"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      User = "root";
      ExecStart = ''${pkgs.writeShellScript "libvirt-net-autostart" ''
          set -e
          export PATH="${pkgs.libvirt}/bin:${pkgs.coreutils}/bin:$PATH"
          virsh net-autostart default 2>/dev/null || virsh net-autostart default
          virsh net-start default 2>/dev/null || true
        ''}'';
    };
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
