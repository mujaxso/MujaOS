{ config, lib, ... }:

let
  cfg = config.programs.brave;
in
{
  options.programs.brave = {
    # only add *new* options that don’t already exist
    adblock.enable = lib.mkEnableOption "Enable Brave’s built-in adblock policy";

    darkMode = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Force dark theme in Brave.";
    };
  };

  config = lib.mkIf cfg.enable {
    # Policies directory (managed by Home Manager)
    xdg.configFile."BraveSoftware/Brave-Browser/Policies/managed/policy.json".text =
      builtins.toJSON (
        lib.mkMerge [
          # 🛡️ Adblock + privacy
          (lib.optionalAttrs (cfg.adblock.enable or false) {
            BraveShieldsAdControl = 2;
            BraveShieldsTrackersBlocked = true;
            BraveShieldsHttpsEverywhere = true;
          })

          # 🌑 Dark mode
          (lib.optionalAttrs cfg.darkMode {
            BraveDarkMode = 1;
          })
        ]
      );
  };
}
