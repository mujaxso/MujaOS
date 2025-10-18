{ pkgs, ...}:
{
  # PipeWire for screen capture
  security.rtkit = {
    enable = true;
  };
}
