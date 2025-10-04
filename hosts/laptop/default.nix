
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    # ../../core/nix.nix
    # ../../core/users.nix
    ../../core/core.nix
    # ../../modules/desktop/hyprland.nix
    # ../../modules/desktop/waybar.nix
    # ../../modules/desktop/kitty.nix
    ../../modules/desktop/desktop.nix
    ../../modules/system/system.nix
  ];

  networking.hostName = "laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # networking.networkmanager.enable = true;
  # networking.wireless.iwd.enable = true;
  # networking.networkmanager.wifi.backend = "iwd";
  # networking.wireless.iwd.settings.Settings.AutoConnect = true;

  # boot.loader.grub = {
  #   enable = true;
  #   device = "/dev/sda"; # or your actual disk (e.g. /dev/nvme0n1)
  #   useOSProber = true; # optional, if you dual boot
  # };

  #environment.etc."hypr/hyprland.conf".source = ./hyprland.conf;
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Make sure GRUB is OFF
  boot.loader.grub.enable = false;

  services.dbus.enable = true;
  system.stateVersion = "25.05";
}
