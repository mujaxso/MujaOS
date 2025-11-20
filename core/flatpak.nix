{pkgs, ...}: {
  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    packages = [
      # "org.mozilla.firefox"
      # "com.spotify.Client"
      # "com.presonus.StudioOne"
    ];
    uninstallUnmanaged = true;
  };
}
