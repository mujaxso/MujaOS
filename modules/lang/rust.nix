{ config, pkgs, ... }:

let
  rust = pkgs.rustChannelOf {
    channel = "stable"; # or "nightly"
  };
in

{
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
    cargo-edit       # manage Cargo.toml dependencies easily
    cargo-watch      # auto-run on file change
    cargo-audit      # audit dependencies for security issues
    cargo-outdated   # check for outdated dependencies
    cargo-tarpaulin  # code coverage for Rust tests
    cargo-nextest    # fast test runner
    cargo-expand     # expand macros
    cargo-make       # task runner
  ];
}
