{
  config,
  pkgs,
  ...
}: let
  # Pick your model here
  aiderConfig = {
    model = "openrouter/qwen/qwen3-235b-a22b:free";
    openai_api_base = "https://openrouter.ai/api/v1";
    temperature = 0.7;
  };
in {
  home.packages = with pkgs; [
    python3
    # aider-chat
    aider-chat-full
  ];

  # Generate the Aider config file
  home.file.".aider.conf.json".text = builtins.toJSON aiderConfig;

  # Optionally: a wrapper script you can use
  home.file."bin/aider-openrouter".text = ''
    #!/bin/sh
    exec aider "$@"
  '';
  home.file."bin/aider-openrouter".executable = true;
}
