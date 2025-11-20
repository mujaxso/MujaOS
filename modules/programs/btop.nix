{
  config,
  pkgs,
  ...
}: {
  home.activation = {
    batCache = ''
      rm -rf ~/.config/btop
    '';
  };

  programs.btop = {
    enable = true;

    settings = {
      # Modern Catppuccin Macchiato theme (more modern than Mocha)
      color_theme = "one_dark";
      theme_background = false;
      truecolor = true;
      force_tty = false;

      # Modern rounded aesthetics
      rounded_corners = true;

      # Braille graphs for highest detail and modern look
      graph_symbol = "braille";
      graph_symbol_cpu = "default";
      graph_symbol_mem = "default";
      graph_symbol_net = "default";
      graph_symbol_proc = "default";

      # Clean layout
      shown_boxes = "cpu mem net proc gpu0";
      presets = "cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty";

      # Smooth updates
      update_ms = 1000;
      proc_update_ms = 2000;
      background_update = true;

      # Vim navigation
      vim_keys = true;

      # CPU modern display
      cpu_bottom = false;
      cpu_graph_upper = "total";
      cpu_graph_lower = "total";
      cpu_invert_lower = true;
      cpu_single_graph = false;
      show_uptime = true;
      show_cpu_watts = true;
      show_cpu_freq = true;
      freq_mode = "average";
      check_temp = true;
      cpu_sensor = "Auto";
      show_coretemp = true;
      cpu_core_map = "";
      temp_scale = "celsius";
      base_10_sizes = false;

      # Memory with graphs
      mem_graphs = true;
      mem_below_net = false;
      show_swap = true;
      swap_disk = true;
      show_disks = true;
      only_physical = true;
      use_fstab = false;
      disk_free_priv = false;
      zfs_arc_cached = true;

      # Disk I/O
      show_io_stat = true;
      io_mode = false;
      io_graph_combined = false;
      io_graph_speeds = "";
      disks_filter = "";

      # Network with auto-scaling
      net_download = 100;
      net_upload = 100;
      net_auto = true;
      net_sync = true;
      net_iface = "";

      # Modern process display with gradients
      proc_sorting = "cpu lazy";
      proc_reversed = false;
      proc_tree = false;
      proc_colors = true;
      proc_gradient = true;
      proc_per_core = false;
      proc_mem_bytes = true;
      proc_cpu_graphs = true;
      proc_info_smaps = false;
      proc_left = false;
      proc_filter_kernel = false;

      # GPU monitoring
      show_gpu_info = "Auto";

      # Battery
      show_battery = true;
      selected_battery = "Auto";

      # Time display
      clock_format = "%X";

      # Logging
      log_level = "WARNING";
    };

    themes = {
      # Doom One - Flagship theme inspired by Atom One Dark
      doom_one = ''
        theme[main_bg]="#282c34"
        theme[main_fg]="#bbc2cf"
        theme[title]="#bbc2cf"
        theme[hi_fg]="#51afef"
        theme[selected_bg]="#3B3F46"
        theme[selected_fg]="#51afef"
        theme[inactive_fg]="#5B6268"
        theme[graph_text]="#bbc2cf"
        theme[meter_bg]="#23272e"
        theme[proc_misc]="#bbc2cf"
        theme[cpu_box]="#51afef"
        theme[mem_box]="#98be65"
        theme[net_box]="#ECBE7B"
        theme[proc_box]="#c678dd"
        theme[div_line]="#1B2229"
        theme[temp_start]="#98be65"
        theme[temp_mid]="#ECBE7B"
        theme[temp_end]="#ff6c6b"
        theme[cpu_start]="#51afef"
        theme[cpu_mid]="#46D9FF"
        theme[cpu_end]="#c678dd"
        theme[free_start]="#98be65"
        theme[free_mid]="#4db5bd"
        theme[free_end]="#51afef"
        theme[cached_start]="#ECBE7B"
        theme[cached_mid]="#da8548"
        theme[cached_end]="#ff6c6b"
        theme[available_start]="#ff6c6b"
        theme[available_mid]="#da8548"
        theme[available_end]="#c678dd"
        theme[used_start]="#98be65"
        theme[used_mid]="#ECBE7B"
        theme[used_end]="#ff6c6b"
        theme[download_start]="#51afef"
        theme[download_mid]="#46D9FF"
        theme[download_end]="#c678dd"
        theme[upload_start]="#98be65"
        theme[upload_mid]="#4db5bd"
        theme[upload_end]="#51afef"
        theme[process_start]="#ff6c6b"
        theme[process_mid]="#da8548"
        theme[process_end]="#c678dd"
      '';

      # One Dark - Atom's iconic theme
      one_dark = ''
        theme[main_bg]="#282c34"
        theme[main_fg]="#abb2bf"
        theme[title]="#abb2bf"
        theme[hi_fg]="#61afef"
        theme[selected_bg]="#3e4451"
        theme[selected_fg]="#61afef"
        theme[inactive_fg]="#5c6370"
        theme[graph_text]="#abb2bf"
        theme[meter_bg]="#2c323c"
        theme[proc_misc]="#abb2bf"
        theme[cpu_box]="#61afef"
        theme[mem_box]="#98c379"
        theme[net_box]="#e5c07b"
        theme[proc_box]="#c678dd"
        theme[div_line]="#181a1f"
        theme[temp_start]="#98c379"
        theme[temp_mid]="#e5c07b"
        theme[temp_end]="#e06c75"
        theme[cpu_start]="#61afef"
        theme[cpu_mid]="#56b6c2"
        theme[cpu_end]="#c678dd"
        theme[free_start]="#98c379"
        theme[free_mid]="#56b6c2"
        theme[free_end]="#61afef"
        theme[cached_start]="#e5c07b"
        theme[cached_mid]="#d19a66"
        theme[cached_end]="#e06c75"
        theme[available_start]="#e06c75"
        theme[available_mid]="#be5046"
        theme[available_end]="#c678dd"
        theme[used_start]="#98c379"
        theme[used_mid]="#e5c07b"
        theme[used_end]="#e06c75"
        theme[download_start]="#61afef"
        theme[download_mid]="#56b6c2"
        theme[download_end]="#c678dd"
        theme[upload_start]="#98c379"
        theme[upload_mid]="#56b6c2"
        theme[upload_end]="#61afef"
        theme[process_start]="#e06c75"
        theme[process_mid]="#be5046"
        theme[process_end]="#c678dd"
      '';

      # Modern Catppuccin Macchiato (vibrant and modern)
      catppuccin_macchiato = ''
        theme[main_bg]="#24273a"
        theme[main_fg]="#cad3f5"
        theme[title]="#cad3f5"
        theme[hi_fg]="#8aadf4"
        theme[selected_bg]="#363a4f"
        theme[selected_fg]="#8aadf4"
        theme[inactive_fg]="#6e738d"
        theme[graph_text]="#f5bde6"
        theme[meter_bg]="#363a4f"
        theme[proc_misc]="#f5bde6"
        theme[cpu_box]="#8aadf4"
        theme[mem_box]="#a6da95"
        theme[net_box]="#eed49f"
        theme[proc_box]="#f5bde6"
        theme[div_line]="#6e738d"
        theme[temp_start]="#a6da95"
        theme[temp_mid]="#eed49f"
        theme[temp_end]="#ed8796"
        theme[cpu_start]="#8aadf4"
        theme[cpu_mid]="#b7bdf8"
        theme[cpu_end]="#c6a0f6"
        theme[free_start]="#a6da95"
        theme[free_mid]="#8bd5ca"
        theme[free_end]="#8aadf4"
        theme[cached_start]="#eed49f"
        theme[cached_mid]="#f5a97f"
        theme[cached_end]="#ed8796"
        theme[available_start]="#ed8796"
        theme[available_mid]="#ee99a0"
        theme[available_end]="#f5bde6"
        theme[used_start]="#a6da95"
        theme[used_mid]="#eed49f"
        theme[used_end]="#ed8796"
        theme[download_start]="#8aadf4"
        theme[download_mid]="#b7bdf8"
        theme[download_end]="#c6a0f6"
        theme[upload_start]="#a6da95"
        theme[upload_mid]="#8bd5ca"
        theme[upload_end]="#8aadf4"
        theme[process_start]="#ed8796"
        theme[process_mid]="#ee99a0"
        theme[process_end]="#f5bde6"
      '';

      # Original Catppuccin Mocha (backup)
      catppuccin_mocha = ''
        theme[main_bg]="#1e1e2e"
        theme[main_fg]="#cdd6f4"
        theme[title]="#cdd6f4"
        theme[hi_fg]="#89b4fa"
        theme[selected_bg]="#313244"
        theme[selected_fg]="#89b4fa"
        theme[inactive_fg]="#6c7086"
        theme[graph_text]="#f5e0dc"
        theme[meter_bg]="#313244"
        theme[proc_misc]="#f5e0dc"
        theme[cpu_box]="#89b4fa"
        theme[mem_box]="#a6e3a1"
        theme[net_box]="#f9e2af"
        theme[proc_box]="#f5c2e7"
        theme[div_line]="#6c7086"
        theme[temp_start]="#a6e3a1"
        theme[temp_mid]="#f9e2af"
        theme[temp_end]="#f38ba8"
        theme[cpu_start]="#89b4fa"
        theme[cpu_mid]="#b4befe"
        theme[cpu_end]="#cba6f7"
        theme[free_start]="#a6e3a1"
        theme[free_mid]="#94e2d5"
        theme[free_end]="#89b4fa"
        theme[cached_start]="#f9e2af"
        theme[cached_mid]="#fab387"
        theme[cached_end]="#f38ba8"
        theme[available_start]="#f38ba8"
        theme[available_mid]="#eba0ac"
        theme[available_end]="#f5c2e7"
        theme[used_start]="#a6e3a1"
        theme[used_mid]="#f9e2af"
        theme[used_end]="#f38ba8"
        theme[download_start]="#89b4fa"
        theme[download_mid]="#b4befe"
        theme[download_end]="#cba6f7"
        theme[upload_start]="#a6e3a1"
        theme[upload_mid]="#94e2d5"
        theme[upload_end]="#89b4fa"
        theme[process_start]="#f38ba8"
        theme[process_mid]="#eba0ac"
        theme[process_end]="#f5c2e7"
      '';

      # Tokyo Night (cyberpunk modern)
      tokyo_night = ''
        theme[main_bg]="#1a1b26"
        theme[main_fg]="#c0caf5"
        theme[title]="#c0caf5"
        theme[hi_fg]="#7aa2f7"
        theme[selected_bg]="#24283b"
        theme[selected_fg]="#7aa2f7"
        theme[inactive_fg]="#565f89"
        theme[graph_text]="#c0caf5"
        theme[meter_bg]="#24283b"
        theme[proc_misc]="#c0caf5"
        theme[cpu_box]="#7aa2f7"
        theme[mem_box]="#9ece6a"
        theme[net_box]="#e0af68"
        theme[proc_box]="#bb9af7"
        theme[div_line]="#565f89"
        theme[temp_start]="#9ece6a"
        theme[temp_mid]="#e0af68"
        theme[temp_end]="#f7768e"
        theme[cpu_start]="#7aa2f7"
        theme[cpu_mid]="#7dcfff"
        theme[cpu_end]="#bb9af7"
        theme[free_start]="#9ece6a"
        theme[free_mid]="#73daca"
        theme[free_end]="#7aa2f7"
        theme[cached_start]="#e0af68"
        theme[cached_mid]="#ff9e64"
        theme[cached_end]="#f7768e"
        theme[available_start]="#f7768e"
        theme[available_mid]="#ff9e64"
        theme[available_end]="#bb9af7"
        theme[used_start]="#9ece6a"
        theme[used_mid]="#e0af68"
        theme[used_end]="#f7768e"
        theme[download_start]="#7aa2f7"
        theme[download_mid]="#7dcfff"
        theme[download_end]="#bb9af7"
        theme[upload_start]="#9ece6a"
        theme[upload_mid]="#73daca"
        theme[upload_end]="#7aa2f7"
        theme[process_start]="#f7768e"
        theme[process_mid]="#ff9e64"
        theme[process_end]="#bb9af7"
      '';

      # Dracula (vibrant modern)
      dracula = ''
        theme[main_bg]="#282a36"
        theme[main_fg]="#f8f8f2"
        theme[title]="#f8f8f2"
        theme[hi_fg]="#ff79c6"
        theme[selected_bg]="#44475a"
        theme[selected_fg]="#ff79c6"
        theme[inactive_fg]="#6272a4"
        theme[graph_text]="#f8f8f2"
        theme[meter_bg]="#44475a"
        theme[proc_misc]="#f8f8f2"
        theme[cpu_box]="#8be9fd"
        theme[mem_box]="#50fa7b"
        theme[net_box]="#f1fa8c"
        theme[proc_box]="#ff79c6"
        theme[div_line]="#6272a4"
        theme[temp_start]="#50fa7b"
        theme[temp_mid]="#f1fa8c"
        theme[temp_end]="#ff5555"
        theme[cpu_start]="#8be9fd"
        theme[cpu_mid]="#bd93f9"
        theme[cpu_end]="#ff79c6"
        theme[free_start]="#50fa7b"
        theme[free_mid]="#8be9fd"
        theme[free_end]="#bd93f9"
        theme[cached_start]="#f1fa8c"
        theme[cached_mid]="#ffb86c"
        theme[cached_end]="#ff5555"
        theme[available_start]="#ff5555"
        theme[available_mid]="#ff79c6"
        theme[available_end]="#bd93f9"
        theme[used_start]="#50fa7b"
        theme[used_mid]="#f1fa8c"
        theme[used_end]="#ff5555"
        theme[download_start]="#8be9fd"
        theme[download_mid]="#bd93f9"
        theme[download_end]="#ff79c6"
        theme[upload_start]="#50fa7b"
        theme[upload_mid]="#f1fa8c"
        theme[upload_end]="#ffb86c"
        theme[process_start]="#ff5555"
        theme[process_mid]="#ff79c6"
        theme[process_end]="#bd93f9"
      '';
    };
  };
}
