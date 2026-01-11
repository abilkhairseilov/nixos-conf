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

    easyeffects
    pavucontrol

    dbus
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = ["gnome" "gtk"];
  };

  programs.sway.enable = true;
}
