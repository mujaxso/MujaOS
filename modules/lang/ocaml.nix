{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    ocaml
    ocamlformat
  ];
}
