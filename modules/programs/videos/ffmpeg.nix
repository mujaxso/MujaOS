{ config, pkgs, ... }:

{
  home.packages = [
    (pkgs.ffmpeg-full.override {
      # Core dependencies
      withUnfree = true;           # Nvidia features, FDK AAC, proprietary codecs
      withFullDeps = true;          # Enable all features
      
      # Hardware acceleration
      withCuda = true;              # NVIDIA CUDA support
      withNvdec = true;             # NVIDIA hardware video decoder
      withNvenc = true;             # NVIDIA hardware video encoder
      withVaapi = true;             # VA-API support (Intel/AMD)
      withVdpau = true;             # VDPAU support
      
      # Video codecs
      withAom = true;               # AV1 codec (libaom)
      withVpx = true;               # VP8/VP9 codec
      withX264 = true;              # H.264 encoder
      withX265 = true;              # H.265/HEVC encoder
      withXvid = true;              # Xvid MPEG-4 encoder
      withWebp = true;              # WebP image format
      withTheora = true;            # Theora video codec
      
      # Audio codecs
      withMp3lame = true;           # MP3 encoder
      withFdkAac = true;            # High-quality AAC encoder
      withOpus = true;              # Opus audio codec
      withVorbis = true;            # Vorbis audio codec
      withOpencoreAmrnb = true;     # AMR-NB audio codec
      
      # Filters and processing
      withVidStab = true;           # Video stabilization
      withZmq = true;               # ZeroMQ filter support
      withFontconfig = true;        # Text rendering with fonts
      withFreetype = true;          # Freetype for text rendering
      
      # Media formats
      withBluray = true;            # Blu-ray disc support
      withOpenjpeg = true;          # JPEG 2000 support
      withSrt = true;               # SRT protocol support
      withAss = true;               # ASS/SSA subtitle support
      
      # Build options
      withGPL = true;               # GPL licensed components
      buildPostproc = true;         # Postprocessing library
      withHeadlessDeps = true;      # Headless dependencies
      withSmallDeps = true;         # Small feature set
      
      # Optional features (disabled by default)
      withDebug = false;            # Debug build
      withTensorflow = false;       # TensorFlow DNN backend (~390 MiB closure)
      withSmallBuild = false;       # Optimize for size over performance
    })
  ];
}
