{
  config,
  pkgs,
  ...
}: let
  # define each imported module
  c = ./c.nix;
  zig = ./zig.nix;
  rust = ./rust.nix;
  shell = ./shell.nix;
  go = ./go.nix;
  java = ./java.nix;
  python = ./python.nix;
  javascript = ./javascript.nix;
  nodejs = ./nodejs.nix;
  php = ./php.nix;
  ruby = ./ruby.nix;
  dart = ./dart.nix;
  nix = ./nix.nix;
  lua = ./lua.nix;
  vlang = ./vlang.nix;
  ocaml = ./ocaml.nix;
  terraform = ./terraform.nix;
  latex = ./latex.nix;
in {
  imports = [
    c
    zig
    rust
    shell
    go
    java
    python
    javascript
    nodejs
    php
    ruby
    dart
    nix
    lua
    vlang
    ocaml
    terraform
    # latex
  ];
}
