{
  pkgs,
  config,
  ...
}: {
  # Enable real-time audio processing
  musnix = {
    enable = true;
    kernel.realtime = true;
    rtirq.enable = true;
  };
}
