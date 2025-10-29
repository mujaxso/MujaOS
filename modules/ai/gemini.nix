{pkgs, ...}: {
  programs.gemini-cli = {
    enable = true;
    package = pkgs.gemini-cli;

    # Optional: Set default model
    defaultModel = "gemini-2.0-flash-exp";

    # Optional: Custom settings
    settings = {
      model = "gemini-2.0-flash-exp";
      temperature = 0.7;
      maxTokens = 8192;
    };

    # Optional: Custom commands
    commands = {
      code-review = {
        description = "Review code for bugs and improvements";
        prompt = "Review this code and suggest improvements";
      };
    };
  };
}
