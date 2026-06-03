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

      model = "deepseek/deepseek-v4-pro";
      small_model = "openai/gpt-5-nano";

      provider = {
        openai = {
          npm = "@ai-sdk/openai";
          name = "OpenAI";
          options = {
            baseURL = "https://api.openai.com/v1";
            timeout = 600000;
            chunkTimeout = 600000;
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
            timeout = 600000;
            chunkTimeout = 600000;
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

        deepseek = {
          npm = "@ai-sdk/openai-compatible";
          name = "DeepSeek";
          options = {
            baseURL = "https://api.deepseek.com/v1";
            timeout = 600000;
            chunkTimeout = 600000;
          };
          models = {
            "deepseek-chat" = {
              name = "DeepSeek Chat";
              limit = {
                context = 128000;
                output = 16000;
              };
            };
            "deepseek-reasoner" = {
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
            timeout = 900000;
            chunkTimeout = 600000;
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

      ## General
      - Be concise. Prefer targeted edits over full rewrites.
      - Prefer grep and targeted reads over reading entire files.
      - Do not re-read the same file more than twice in one step.
      - If stuck after 3 attempts, stop and explain instead of retrying.

      ## Rust
      - Never run cargo fmt or rustfmt automatically after edits.
      - Only format after the code compiles successfully.
      - Make minimal targeted edits when fixing borrow checker errors.
      - Always use `cargo check -p <crate>` for validation — never cargo build on the full workspace.
      - NEVER run cargo build, cargo test, or cargo run directly — use oc-run instead.

      ## Long-running commands — THIS IS MANDATORY, NO EXCEPTIONS
      - The shell tool has a hard timeout of 120 seconds.
      - ANY command that may take more than 30 seconds MUST use oc-run:
          oc-run cargo check -p zaroxi-core-engine-render
          oc-run cargo test -p zaroxi-interface-desktop
      - oc-run returns immediately with a PID — it never blocks.
      - After launching with oc-run, read output with: cat /tmp/oc-out.txt
      - Wait for completion: wait <PID> && cat /tmp/oc-out.txt
      - Check if still running: kill -0 <PID> 2>/dev/null && echo "running" || echo "done"
      - Commands that MUST always use oc-run:
          cargo build, cargo test, cargo run, cargo check (large crates)
          any grep across the full workspace
          any compiler or linker invocation

      ## Git
      - Use git add -A && git commit -m "<message>" for commits.
      - Use the small model for commit message generation.
      - Never amend commits unless explicitly asked.

      ## Context efficiency
      - Read only relevant sections of large files.
      - Use grep to locate symbols before reading files.
      - Avoid loading multiple large files into context simultaneously.
    '';
  };

  home.file.".local/bin/oc-run" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      # Usage: oc-run <command and args>
      # Runs command in background to avoid shell tool timeout.
      # Output streams to /tmp/oc-out.txt
      rm -f /tmp/oc-out.txt
      "$@" > /tmp/oc-out.txt 2>&1 &
      PID=$!
      echo "Started PID:$PID"
      echo "Output:  /tmp/oc-out.txt"
      echo "Poll:    tail -f /tmp/oc-out.txt"
      echo "Wait:    wait $PID && cat /tmp/oc-out.txt"
    '';
  };
}
