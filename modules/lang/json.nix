{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vscode-json-languageserver
  ];
}
