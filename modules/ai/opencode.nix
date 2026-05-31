{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.opencode = {
    enable = true;
    package = pkgs.opencode.overrideAttrs (old: {
      autoPatchelfIgnoreMissingDeps = [
        "libc.musl-x86_64.so.1"
        "libX11.so.6"
      ];
    });

    settings = {
      autoupdate = false;
      share = "disabled";
      default_agent = "build";
      snapshot = false;

      model = "openai/gpt-5-mini";
      small_model = "openai/gpt-5-nano";

      enabled_providers = ["openai" "openrouter" "ollama"];

      provider = {
        openai = {
          npm = "@ai-sdk/openai";
          name = "OpenAI";
          options = {
            baseURL = "https://api.openai.com/v1";
            timeout = 300000;
            chunkTimeout = 300000;
          };
          models = {
            "gpt-5-mini" = {
              name = "GPT-5 Mini";
              limit = {
                context = 1000000;
                output = 32000;
              };
            };
            "gpt-5-nano" = {
              name = "GPT-5 Nano";
              limit = {
                context = 1000000;
                output = 16000;
              };
            };
          };
        };

        openrouter = {
          npm = "@ai-sdk/openai-compatible";
          name = "OpenRouter";
          options = {
            baseURL = "https://openrouter.ai/api/v1";
            timeout = 300000;
            chunkTimeout = 300000;
          };
          models = {
            "openai/gpt-5-mini" = {
              name = "GPT-5 Mini via OpenRouter";
              limit = {
                context = 1000000;
                output = 32000;
              };
            };
            "openai/gpt-5-nano" = {
              name = "GPT-5 Nano via OpenRouter";
              limit = {
                context = 1000000;
                output = 16000;
              };
            };
            "deepseek/deepseek-chat" = {
              name = "DeepSeek Chat";
              limit = {
                context = 128000;
                output = 16000;
              };
            };
            "deepseek/deepseek-reasoner" = {
              name = "DeepSeek Reasoner";
              limit = {
                context = 128000;
                output = 16000;
              };
            };
          };
        };

        ollama = {
          npm = "@ai-sdk/openai-compatible";
          name = "Ollama";
          options = {
            baseURL = "http://127.0.0.1:11434/v1";
            timeout = 600000;
            chunkTimeout = 300000;
          };
          models = {
            "qwen3-coder:30b" = {
              name = "Qwen3 Coder 30B";
              limit = {
                context = 32000;
                output = 8000;
              };
            };
            "qwen3-coder:latest" = {
              name = "Qwen3 Coder";
              limit = {
                context = 32000;
                output = 8000;
              };
            };
            "deepseek-r1:latest" = {
              name = "DeepSeek R1 Local";
              limit = {
                context = 32000;
                output = 8000;
              };
            };
          };
        };
      };

      compaction = {
        auto = true;
        prune = true;
        reserved = 20000;
      };

      watcher.ignore = [
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
        "**/*.lock"
        "**/package-lock.json"
        "**/pnpm-lock.yaml"
        "**/yarn.lock"
        "**/Cargo.lock"
      ];

      permission = {
        edit = "ask";
        bash = "ask";
      };
    };
  };

  home.file.".opencode/commands/commit.md" = {
    text = ''
      ---
      description: Stage all changes and commit with a conventional message
      ---
      Run git add -A, then generate a conventional commit message from the diff.
      Format: type(scope): summary (max 72 chars).
      Types: feat, fix, refactor, chore, docs, style, test, perf.
      Then run git commit -m "<message>".
      Use the small model.
    '';
  };

  home.file.".opencode/AGENTS.md" = {
    text = ''
      # Agent Rules
      - Never run cargo fmt or rustfmt automatically after edits
      - Only format after the code compiles successfully
      - Make minimal targeted edits when fixing borrow checker errors
      - If cargo build fails after 3 attempts on the same file, stop and explain
      - Prefer grep and targeted reads over reading entire files
      - For Rust builds use: cargo check -p <crate-name> instead of cargo build
      - cargo check is faster than cargo build — prefer it for validation
      - Never run cargo build on the entire workspace, always target a specific crate with -p
    '';
  };
}
