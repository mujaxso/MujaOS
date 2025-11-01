{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    qbittorrent
    transmission_4-gtk
  ];

  home.file.".config/qBittorrent/qBittorrent.conf" = {
    force = true;
    text = ''
      [Preferences]
      General\Locale=en
      Advanced\useSystemIconTheme=true

      [Application]
      GUI\Appearance\DarkModeColors=true

      [BitTorrent]
      Session\DefaultSavePath=${config.home.homeDirectory}/Downloads
      Session\TempPath=${config.home.homeDirectory}/Downloads/incomplete
      Session\TempPathEnabled=true

      [LegalNotice]
      Accepted=true

      [Downloads]
      SavePath=${config.home.homeDirectory}/Downloads
      TempPathEnabled=true
      TempPath=${config.home.homeDirectory}/Downloads/incomplete
    '';
  };

  home.file.".config/transmission/settings.json".text = builtins.toJSON {
    download-dir = "${config.home.homeDirectory}/Downloads";
    incomplete-dir-enabled = true;
    incomplete-dir = "${config.home.homeDirectory}/Downloads/incomplete";
    rpc-enabled = true;
    rpc-port = 9091;
    rpc-whitelist-enabled = false;
    speed-limit-down-enabled = false;
    speed-limit-up-enabled = false;
  };
}
