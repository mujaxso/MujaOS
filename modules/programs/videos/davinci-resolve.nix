{pkgs, ...}: {
  home.packages = with pkgs; [
    davinci-resolve
  ];

  xdg.desktopEntries.davinci-resolve = {
    name = "DaVinci Resolve";
    genericName = "Video Editor";
    exec = "env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia davinci-resolve";
    icon = "davinci-resolve";
    type = "Application";
    terminal = false;
    categories = ["AudioVideo" "VideoEditing"];
    comment = "Professional video editing software";
  };
}
