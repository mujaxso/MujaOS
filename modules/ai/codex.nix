{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.codex;

  # Generate config.toml for ~/.codex/config.toml
  configToml = pkgs.writeText "config.toml" ''
    # Model configuration
    model = "${cfg.model}"

    ${optionalString (cfg.approvalMode != null) ''
      approval_mode = "${cfg.approvalMode}"
    ''}

    ${optionalString (cfg.temperature != null) ''
      temperature = ${toString cfg.temperature}
    ''}

    ${optionalString (cfg.maxTokens != null) ''
      max_tokens = ${toString cfg.maxTokens}
    ''}

    ${optionalString (cfg.reasoning_effort != null) ''
      model_reasoning_effort = "${cfg.reasoning_effort}"
    ''}

    ${cfg.extraConfig}
  '';
in {
  options.services.codex = {
    enable = mkEnableOption "OpenAI Codex CLI";

    package = mkOption {
      type = types.package;
      default = pkgs.codex;
      description = "The Codex CLI package to use from nixpkgs";
    };

    model = mkOption {
      type = types.str;
      default = "gpt-4o";
      description = "Model to use for code generation";
      example = "gpt-4o-mini";
    };

    approvalMode = mkOption {
      type = types.nullOr (types.enum ["suggest" "auto-edit" "full-auto"]);
      default = "suggest";
      description = ''
        Approval mode:
        - suggest: Propose edits requiring approval (default)
        - auto-edit: Auto read/write files, ask for shell commands
        - full-auto: Autonomous execution in sandbox
      '';
    };

    temperature = mkOption {
      type = types.nullOr types.float;
      default = 0.7;
      description = "Temperature for model responses (0.0-2.0)";
    };

    maxTokens = mkOption {
      type = types.nullOr types.int;
      default = null;
      description = "Maximum tokens per response";
    };

    reasoning_effort = mkOption {
      type = types.nullOr (types.enum ["low" "medium" "high"]);
      default = null;
      description = "Reasoning effort level for models that support it";
    };

    extraConfig = mkOption {
      type = types.lines;
      default = "";
      description = "Extra configuration to append to config.toml";
      example = ''
        [mcp_servers.example]
        command = "npx"
        args = ["-y", "@package/server"]
      '';
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      home.packages = [cfg.package];

      # Create ~/.codex/config.toml
      home.file.".codex/config.toml".source = configToml;
    })

    # Your default configuration
    {
      services.codex = {
        enable = true;
        model = "gpt-4o";
        approvalMode = "suggest";
        temperature = 0.7;
        reasoning_effort = "medium";

        extraConfig = ''
          # Add any additional TOML config here
        '';
      };
    }
  ];
}
