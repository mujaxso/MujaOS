{
  pkgs,
  lib,
  ...
}: {
  programs.zed-editor = {
    enable = true;

    extensions = [
      "c"
      "zig"
      "rust"
      "nix"
      "toml"
      "dockerfile"
      "git-firefly"
    ];

    extraPackages = with pkgs; [
      # Language servers
      nixd
      nil
      bash-language-server
      shellcheck

      # Formatters
      nixpkgs-fmt
      alejandra
      shfmt
    ];

    userSettings = {
      # Theme and appearance
      theme = {
        mode = "system";
        light = "One Light";
        dark = "One Dark";
      };
      ui_font_size = 16;
      buffer_font_size = 14;
      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_line_height = {
        custom = 1.5;
      };

      # Vim mode
      vim_mode = true;
      relative_line_numbers = true;

      # Editor behavior
      auto_update = false;
      cursor_blink = false;
      show_whitespaces = "selection";
      show_wrap_guides = true;
      wrap_guides = [80 120];
      confirm_quit = false;
      restore_on_startup = "last_session";

      # Auto-save
      autosave = {
        after_delay = {
          milliseconds = 1000;
        };
      };

      # Format on save
      format_on_save = "on";
      ensure_final_newline_on_save = true;

      # Telemetry
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      # Git integration
      git = {
        git_gutter = "tracked_files";
        inline_blame = {
          enabled = true;
          delay_ms = 600;
        };
      };

      # Terminal
      terminal = {
        font_family = "JetBrainsMono Nerd Font";
        font_size = 14;
        line_height = "comfortable";
        shell = "system";
        env = {
          EDITOR = "zed --wait";
        };
      };

      # LSP configuration
      lsp = {
        nixd = {
          binary = {
            path_lookup = true;
          };
          initialization_options = {
            formatting = {
              command = ["${pkgs.alejandra}/bin/alejandra"];
            };
          };
        };
        nil = {
          binary = {
            path_lookup = true;
          };
        };
        bash-language-server = {
          binary = {
            path_lookup = true;
          };
        };
      };

      # Language-specific settings
      languages = {
        Nix = {
          tab_size = 2;
          hard_tabs = false;
          formatter = {
            external = {
              command = "alejandra";
              arguments = [];
            };
          };
          format_on_save = "on";
        };
        Bash = {
          tab_size = 2;
          formatter = {
            external = {
              command = "shfmt";
              arguments = ["-i" "2"];
            };
          };
        };
      };

      # Inlay hints
      inlay_hints = {
        enabled = true;
        show_type_hints = true;
        show_parameter_hints = true;
        show_other_hints = true;
      };

      # Indentation guides
      indent_guides = {
        enabled = true;
        line_width = 1;
        active_line_width = 1;
        coloring = "indent_aware";
      };

      # Scrollbar
      scrollbar = {
        show = "auto";
        git_diff = true;
        diagnostics = "all";
      };

      # Panels
      project_panel = {
        button = true;
        dock = "left";
        git_status = true;
        auto_reveal_entries = true;
        default_width = 280;
      };

      outline_panel = {
        dock = "right";
        default_width = 300;
      };

      # Tab behavior
      tabs = {
        file_icons = true;
        git_status = true;
        close_position = "right";
      };

      # Centered layout for focus mode
      centered_layout = {
        left_padding = 0.15;
        right_padding = 0.15;
      };

      # Direnv support
      load_direnv = "shell_hook";

      # File exclusions
      file_scan_exclusions = [
        "**/.git"
        "**/.direnv"
        "**/result"
        "**/target"
        "**/.cache"
        "**/node_modules"
      ];
    };
  };
}
