{ config, lib, pkgs, ... }:

{

  services = {
    xserver = {
      enable = true;
      xkb.options = "ctrl:nocaps";
    };

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # logind.lidSwitch = {
    #   enable = true;
    # };
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.battery-health-charging
    kdePackages.kdeconnect-kde
    wl-clipboard-x11

    easyeffects
    pavucontrol

    dbus
  ];

  # security.pam.service = {
  #   gdm.enableGnomeKeyring = true;
  # };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome pkgs.xdg-desktop-portal-gtk ];
    config.common.default = ["gnome" "gtk" "wlr"];
  };

  programs.sway.enable = true;
}
