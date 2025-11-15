{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware.nix
    # ../../core/users.nix
    ../../core/core.nix
    ../../modules/desktop/sddm/sddm.nix
    # ../../modules/desktop/suckelss/suckless.nix
    #../../modules/desktop/light.nix
    ../../modules/system/system.nix
    ../../modules/lang/lang.nix
    # ../../modules/desktop/xdg.nix
    ../../modules/programs/thunar.nix
    # ../../modules/programs/gpg.nix
  ];

  # Define your hostname.
  networking.hostName = "laptop";

  # Enable networking
  #networking.networkmanager.enable = true;
  # networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.appstream
  # networking.wireless.iwd.enable = true;
  # networking.networkmanager.wifi.backend = "iwd";
  # networking.wireless.iwd.settings.Settings.AutoConnect = true;
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # boot.loader.grub = {
  #   enable = true;
  #   device = "/dev/sda"; # or your actual disk (e.g. /dev/nvme0n1)
  #   useOSProber = true; # optional, if you dual boot
  # };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Make sure GRUB is OFF
  boot.loader.grub.enable = false;

  xdg.portal.wlr.enable = false;

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    git
    neovim
    wget
    zip
  ];

  system.stateVersion = "25.05";
}
