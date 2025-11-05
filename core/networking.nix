{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./local-networking.nix
  ];

  networking.firewall = {
    trustedInterfaces = ["virbr0"];
    # checkReversePath = false;
  };

  # add any subdomain dynamically
  local.networking.hosts = {
    # Uses defaults: 127.0.0.1 blog.localhost
    blog = {};
    projects = {};
    music = {};
    funmacs = {};
    mujaos = {};
    api = {};
    admin = {};
    # Creates: 192.168.1.50 staging.local
    staging = {
      ip = "192.168.1.50";
      domain = "local";
    };
    # Creates: 127.0.0.1 api.test
    api = {
      domain = "test";
    };
  };
}
