{
  config,
  pkgs,
  ...
}: let
  rust = pkgs.rustChannelOf {
    channel = "stable"; # or "nightly"
  };
in {
  environment.systemPackages = with pkgs; [
    # Core Rust tools
    # rustup
    rustc
    cargo

    # Official Rust sub-tools
    rustfmt
    clippy
    rust-analyzer

    # Popular cargo extensions
    cargo-edit # manage Cargo.toml dependencies easily
    cargo-watch # auto-run on file change
    cargo-audit # audit dependencies for security issues
    cargo-outdated # check for outdated dependencies
    cargo-tarpaulin # code coverage for Rust tests
    cargo-nextest # fast test runner
    cargo-expand # expand macros
    cargo-make # task runner

    wasm-pack # wasm
    binaryen # For wasm-opt optimization (used by wasm-pack)
    cargo-tauri # tauri app

    # GLib (fixes your error)
    glib.dev
    glib

    # GTK + WebKit for Tauri
    gtk3
    webkitgtk_4_1

    # Common extras
    librsvg
    openssl
    cairo
    pango
    gdk-pixbuf

    tree-sitter
  ];

  environment.variables.PKG_CONFIG_PATH = [
    "${pkgs.glib.dev}/lib/pkgconfig"
  ];
}
