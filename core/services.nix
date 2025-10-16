{ config, pkgs, ...}:
{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
  
  services.dbus = {
    enable = true;
  };
  
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    # Video drivers (usually auto-detected, but can be specified)
    # videoDrivers = [ "intel" ]; # or "nvidia", "amdgpu", etc.
    
    displayManager.session = [{
      manage = "desktop";
      name = "home-manager";
      start = ''
      exec $HOME/.xsession
    '';
    }];
  };
  
  services.displayManager.sddm = {
    enable = true;
  };
    
  services.libinput = {
    enable = true;
  };

}
