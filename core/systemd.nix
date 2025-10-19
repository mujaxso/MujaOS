{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = ["hyprland" "gtk"];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
  ];

  systemd.user.services.xdg-desktop-portal = {
    after = ["xdg-desktop-portal-hyprland.service"];
    wants = ["xdg-desktop-portal-hyprland.service"];
  };
}
