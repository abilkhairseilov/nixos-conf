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

  programs.sway.enable = true;
}
