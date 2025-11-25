# ===================================================================
# COMPLETE PROFESSIONAL AUDIO PRODUCTION SETUP
# Everything needed for music production on NixOS
# ===================================================================
{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # ===================================================================
    # DAWs - Digital Audio Workstations
    # ===================================================================
    #reaper # $60 - Most stable, pro mixing/recording
    bitwig-studio # Modern, beautiful UI - native Linux
    ardour # FREE - Open-source tracking powerhouse
    lmms # FREE - Electronic music + MIDI sequencing

    # ===================================================================
    # WINDOWS PLUGIN SUPPORT - Use prebuilt versions
    # ===================================================================
    wineWowPackages.staging # Use wineWowPackages instead of wine-staging
    winetricks
    yabridge # Should be in binary cache
    yabridgectl # Should be in binary cache

    # ===================================================================
    # EFFECT PLUGIN BUNDLES - The Sound Processors
    # ===================================================================
    calf # 47+ pro effects (reverb, delay, compression, filters)
    lsp-plugins # Surgical mixing tools (multiband comp, EQ, gates)
    zam-plugins # Mastering effects and utilities
    x42-plugins # Analysis tools, meters, EQ, compression
    airwindows-lv2 # 280+ creative character effects

    # ===================================================================
    # SYNTHESIZERS - Sound Generation
    # ===================================================================
    vital # Modern wavetable synth (rivals $189 Serum)
    zynaddsubfx # Complex additive/subtractive synthesis
    dexed # FM synthesis (Yamaha DX7 emulation)
    surge-XT # 2,285 presets - hybrid wavetable/FM/analog
    cardinal # Modular synthesis (Eurorack emulation)
    sfizz # Orchestral/acoustic sample player (SFZ)
    geonkick # Kick drum synthesis - electronic bass essential
    helm # Polyphonic synth with clean interface
    yoshimi # Real-time software synthesizer

    # ===================================================================
    # DRUMS & PERCUSSION
    # ===================================================================
    hydrogen # Drum machine with pattern sequencer + samples
    drumgizmo # Multichannel drum sampler with realistic kits

    # ===================================================================
    # ESSENTIAL EFFECTS
    # ===================================================================
    dragonfly-reverb # Industry-grade reverb - mixing essential
    gxplugins-lv2 # Guitar amps and pedal effects suite
    chow-tape-model # Analog tape saturation emulation (fixed name)

    eq10q # 10-band parametric EQ + spectrum analyzer

    # ===================================================================
    # AUDIO ROUTING & PATCHBAY - Connect Everything
    # ===================================================================
    qpwgraph # PipeWire graph patchbay (modern, recommended)
    qjackctl # JACK audio connection kit control
    helvum # PipeWire patchbay (alternative GUI)
    a2jmidid # ALSA to JACK MIDI bridge

    # ===================================================================
    # RECORDING & EDITING TOOLS
    # ===================================================================
    audacity # Multi-track audio editor/recorder
    ocenaudio # Fast audio editor (alternative)

    # ===================================================================
    # MIDI SEQUENCING & COMPOSITION
    # ===================================================================
    rosegarden # MIDI sequencer + notation
    musescore # Professional music notation software
    tuxguitar # Guitar tablature editor

    # ===================================================================
    # ANALYSIS & VISUALIZATION TOOLS
    # ===================================================================
    sonic-visualiser # Detailed audio analysis and visualization (includes spectral analysis)
    eq10q # Already in config - includes spectrum analyzer

    # ===================================================================
    # PLUGIN MANAGEMENT & COMPATIBILITY
    # ===================================================================
    carla # Plugin host - chain effects, save racks
    yabridge # Windows VST bridge - seamless Windows plugin support

    # ===================================================================
    # UTILITIES
    # ===================================================================
    pavucontrol # PulseAudio/PipeWire volume control
    easyeffects # System-wide audio effects
    faust # Functional audio programming language

    # ===================================================================
    # SAMPLE MANAGEMENT
    # ===================================================================
    #lsp-plugins-lv2 # Includes sampler plugins
  ];

  # ===================================================================
  # SYSTEM OPTIMIZATION (Add to configuration.nix, not home-manager)
  # ===================================================================
  # Enable real-time audio processing
  # imports = [ <musnix> ];
  # musnix.enable = true;
  # musnix.kernel.realtime = true;
  # musnix.rtirq.enable = true;

  # ===================================================================
  # PLUGIN PATH ENVIRONMENT VARIABLES
  # Tell DAWs where to find plugins installed by NixOS
  # ===================================================================
  home.sessionVariables = {
    VST_PATH = "$HOME/.vst:$HOME/.nix-profile/lib/vst:/run/current-system/sw/lib/vst";
    VST3_PATH = "$HOME/.vst3:$HOME/.nix-profile/lib/vst3:/run/current-system/sw/lib/vst3";
    LXVST_PATH = "$HOME/.lxvst:$HOME/.nix-profile/lib/lxvst:/run/current-system/sw/lib/lxvst";
    LV2_PATH = "$HOME/.lv2:$HOME/.nix-profile/lib/lv2:/run/current-system/sw/lib/lv2";
    LADSPA_PATH = "$HOME/.ladspa:$HOME/.nix-profile/lib/ladspa:/run/current-system/sw/lib/ladspa";
    DSSI_PATH = "$HOME/.dssi:$HOME/.nix-profile/lib/dssi:/run/current-system/sw/lib/dssi";
  };

  # ===================================================================
  # CREATE PLUGIN DIRECTORY SYMLINKS
  # This makes plugins accessible in standard locations
  # ===================================================================
  home.file = {
    # LV2 plugins symlink
    ".lv2".source =
      config.lib.file.mkOutOfStoreSymlink
      "${config.home.profileDirectory}/lib/lv2";

    # VST plugins symlink
    ".vst".source =
      config.lib.file.mkOutOfStoreSymlink
      "${config.home.profileDirectory}/lib/vst";

    # VST3 plugins symlink
    ".vst3".source =
      config.lib.file.mkOutOfStoreSymlink
      "${config.home.profileDirectory}/lib/vst3";

    # LXVST plugins symlink
    ".lxvst".source =
      config.lib.file.mkOutOfStoreSymlink
      "${config.home.profileDirectory}/lib/lxvst";

    # # ADD THIS - Dark menu bar configuration
    # ".config/REAPER/libSwell-user.colortheme".text = ''
    #   menubar=40,40,40
    #   menubar_text=220,220,220
    #   menubar_hl=60,60,60
    #   menubar_hl_text=255,255,255
    #   window_bg=45,45,45
    #   window_text=220,220,220
    #   button_bg=55,55,55
    #   button_text=220,220,220
    #   scrollbar=60,60,60
    #   scrollbar_thumb=90,90,90
    #   3dface=50,50,50
    #   3dhilight=70,70,70
    #   3dshadow=30,30,30
    #   infobk=60,60,60
    #   infotext=220,220,220
    # '';
  };
}
