# modules/local-networking.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.local.networking;
in {
  options.local.networking = {
    hosts = mkOption {
      type = types.attrsOf (types.submodule {
        options = {
          ip = mkOption {
            type = types.str;
            default = "127.0.0.1";
            description = "IP address to map to";
          };

          domain = mkOption {
            type = types.str;
            default = "localhost";
            description = "Domain suffix (e.g., localhost, test, dev)";
          };
        };
      });
      default = {};
      description = "Dynamic host entries. Attribute name becomes subdomain.";
    };
  };

  config = {
    networking.extraHosts = concatStringsSep "\n" (
      mapAttrsToList (
        name: hostCfg: "${hostCfg.ip} ${name}.${hostCfg.domain}"
      )
      cfg.hosts
    );
  };
}
