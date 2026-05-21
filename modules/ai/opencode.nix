{
  config,
  pkgs,
  ...
}: {
  programs.opencode = {
    enable = true;
    package = pkgs.opencode;

    settings = {
      autoupdate = false;
      share = "disabled";
      default_agent = "build";
      snapshot = false;

      # Keep model choice configurable without storing secrets in Nix.
      model = "openai/gpt-5-mini";
      small_model = "openai/gpt-5-nano";

      enabled_providers = [
        "openai"
        "openrouter"
        "ollama"
      ];

      provider = {
        openai = {
          npm = "@ai-sdk/openai";
          name = "OpenAI";
          options = {
            baseURL = "https://api.openai.com/v1";
            timeout = 180000;
            chunkTimeout = 45000;
          };
          models = {
            "gpt-5-mini" = {
              name = "GPT-5 Mini";
            };
            "gpt-5-nano" = {
              name = "GPT-5 Nano";
            };
          };
        };

        openrouter = {
          npm = "@ai-sdk/openai-compatible";
          name = "OpenRouter";
          options = {
            baseURL = "https://openrouter.ai/api/v1";
            timeout = 180000;
            chunkTimeout = 45000;
          };
          models = {
            "openai/gpt-5-mini" = {
              name = "GPT-5 Mini via OpenRouter";
            };
            "openai/gpt-5-nano" = {
              name = "GPT-5 Nano via OpenRouter";
            };
            "deepseek/deepseek-chat" = {
              name = "DeepSeek Chat";
            };
            "deepseek/deepseek-reasoner" = {
              name = "DeepSeek Reasoner";
            };
          };
        };

        ollama = {
          npm = "@ai-sdk/openai-compatible";
          name = "Ollama";
          options = {
            baseURL = "http://127.0.0.1:11434/v1";
            timeout = 180000;
            chunkTimeout = 45000;
          };
          models = {
            "qwen3-coder:30b" = {
              name = "Qwen3 Coder 30B";
            };
            "qwen3-coder:latest" = {
              name = "Qwen3 Coder";
            };
            "deepseek-r1:latest" = {
              name = "DeepSeek R1 Local";
            };
          };
        };
      };

      compaction = {
        auto = true;
        prune = true;
        reserved = 3000;
      };

      watcher = {
        ignore = [
          "**/.git/**"
          "**/node_modules/**"
          "**/dist/**"
          "**/build/**"
          "**/.next/**"
          "**/target/**"
          "**/.direnv/**"
          "**/.devenv/**"
          "**/.turbo/**"
          "**/coverage/**"
          "**/.cache/**"
          "**/.venv/**"
          "**/vendor/**"
          "**/.idea/**"
          "**/.zed/**"
          "**/*.lock"
          "**/package-lock.json"
          "**/pnpm-lock.yaml"
          "**/yarn.lock"
          "**/Cargo.lock"
        ];
      };

      permission = {
        edit = "ask";
        bash = "ask";
      };
    };
  };

  home.sessionVariables = {
    OPENCODE_DISABLE_DEFAULT_PLUGINS = "1";
    OPENCODE_DISABLE_MODELS_FETCH = "1";
    OPENCODE_DISABLE_LSP_DOWNLOAD = "1";
    OPENCODE_EXPERIMENTAL_DISABLE_FILEWATCHER = "1";
    OPENCODE_EXPERIMENTAL_OUTPUT_TOKEN_MAX = "1024";
  };
}
