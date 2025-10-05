{ config, pkgs, lib, ... }:

{
  imports = [
    ./config.nix
    ./style.nix
  ];


  options.services.waybar.enable = lib.mkEnableOption "Enable Waybar";

  config = lib.mkIf config.services.waybar.enable {
    #environment.systemPackages = [ pkgs.waybar ];

    environment.etc."xdg/waybar/config".text =
      builtins.toJSON config.services.waybar.settings;

    environment.etc."xdg/waybar/style.css".text =
      config.services.waybar.css;

    systemd.user.services.waybar = {
      description = "Waybar";
      serviceConfig = {
        ExecStart = "${pkgs.waybar}/bin/waybar";
        Restart = "on-failure";
      };
      wantedBy = [ "default.target" ];
    };
  };


}
