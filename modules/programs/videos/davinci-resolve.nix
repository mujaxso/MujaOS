{pkgs, ...}: {
  home.packages = with pkgs; [
    (davinci-resolve.overrideAttrs (oldAttrs: {
      postInstall =
        (oldAttrs.postInstall or "")
        + ''
          sed -i 's/VideoEditing/X-VideoEditing/g' $out/share/applications/*.desktop || true
        '';
    }))
  ];

  xdg.desktopEntries.davinci-resolve = {
    name = "DaVinci Resolve";
    genericName = "Video Editor";
    exec = "env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia davinci-resolve %U";
    icon = "davinci-resolve";
    type = "Application";
    terminal = false;
    categories = ["AudioVideo" "Video"];
    mimeType = ["video/x-matroska" "video/mp4" "video/quicktime" "video/x-msvideo"];
    comment = "Professional video editing software";
  };
}
