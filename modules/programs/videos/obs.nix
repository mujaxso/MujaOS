{
  config,
  pkgs,
  ...
}: {
  programs.obs-studio = {
    enable = true;

    # Optional: Enable hardware acceleration
    # For NVIDIA GPUs:
    # package = pkgs.obs-studio.override { cudaSupport = true; };
    # For AMD GPUs, include obs-vaapi in plugins list below

    plugins = with pkgs.obs-studio-plugins; [
      # REMOVE wlrobs - it's outdated and causes color issues
      wlrobs

      # Audio
      obs-pipewire-audio-capture
      obs-tuna

      # Video effects
      obs-backgroundremoval
      obs-composite-blur
      obs-shaderfilter
      obs-3d-effect

      # Transitions
      obs-move-transition

      # Scene management
      advanced-scene-switcher
      obs-source-switcher
      obs-source-clone
      obs-replay-source

      # Streaming
      obs-multi-rtmp
      distroav
      obs-source-record

      # Hardware acceleration
      obs-vaapi
      obs-gstreamer
      obs-vkcapture

      # Visual effects
      obs-gradient-source
      obs-stroke-glow-shadow

      # Input display
      input-overlay
      droidcam-obs

      # Canvas
      obs-vertical-canvas

      # Interactive
      obs-scale-to-sound
      obs-command-source
      obs-text-pthread

      # Utilities
      obs-websocket
      looking-glass-obs
    ];
  };
}
