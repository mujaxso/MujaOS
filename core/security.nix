{pkgs, ...}: {
  # PipeWire for screen capture
  security.rtkit = {
    enable = true;
  };

  security.polkit = {
    enable = true;
  };
}
