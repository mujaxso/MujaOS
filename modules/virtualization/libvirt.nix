{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    virt-manager
    virt-viewer
    spice-vdagent
    spice-gtk
  ];

  home.sessionVariables = {
    LIBVIRT_DEFAULT_URI = "qemu:///system";
  };

  # dconf.settings = {
  #   "org/virt-manager/virt-manager/connections" = {
  #     autoconnect = ["qemu:///system"];
  #     uris = ["qemu:///system"];
  #   };
  # };
}
