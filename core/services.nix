{
  config,
  pkgs,
  ...
}: {
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    dbus = {
      enable = true;
    };

    xserver = {
      enable = true;
      xkb.layout = "us";
      # Video drivers (usually auto-detected, but can be specified)
      # videoDrivers = [ "intel" ]; # or "nvidia", "amdgpu", etc.

      displayManager.session = [
        {
          manage = "desktop";
          name = "home-manager";
          start = ''
            exec $HOME/.xsession
          '';
        }
      ];
    };

    displayManager.sddm = {
      enable = true;
    };

    libinput = {
      enable = true;
    };

    # Required services for Thunar features

    gvfs.enable = true; # Trash, mount, network support
    tumbler.enable = true; # Image thumbnails

    # Optional: Auto-mounting USB drives
    udisks2.enable = true;
  };
}
