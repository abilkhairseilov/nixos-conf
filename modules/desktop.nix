{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.battery-health-charging
    kdePackages.kdeconnect-kde

    easyeffects
    pavucontrol
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = ["gnome" "gtk"];
  };

  programs.sway.enable = true;
}
