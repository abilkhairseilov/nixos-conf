{ config, lib, pkgs, ... }:

{

  services = {
    xserver = {
      enable = true;
      xkb.options = "ctrl:nocaps";
    };

    displayManager.ly.enable = true;
    # desktopManager.gnome.enable = true;

    # logind.lidSwitch = {
    #   enable = true;
    # };
    #
    tailscale = {
      enable = true;
    };

    snapper = {
      configs = {
        home = {
          SUBVOLUME = "/home";
          TIMELINE_CREATE = true;
          TIMELINE_CLEANUP = true;
        };
      };
    };
    gvfs.enable = true;
    udisks2.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kdePackages.kdeconnect-kde
    wl-clipboard-x11

    libsForQt5.qt5ct
    kdePackages.qt6ct

    easyeffects
    pavucontrol

    dbus
    mpd

    tailscale
    snapper

    ntfs3g
    usbutils
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

  programs = {
    sway.enable = true;
    appimage = {
      enable = true;
      binfmt = true;
    };
  };

}
