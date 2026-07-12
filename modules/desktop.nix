{ config, lib, pkgs, ... }:

{

  services = {
    xserver = {
      enable = true;
      xkb.options = "ctrl:nocaps";
    };

    displayManager.ly.enable = true;

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

# systemd.services.shadowsocks-client = {
#     description = "Shadowsocks-Rust Client Service";
#     after = [ "network.target" ];
#     wantedBy = [ "multi-user.target" ];
#     serviceConfig = {
#       ExecStart = "${pkgs.shadowsocks-rust}/bin/sslocal -s YOUR_SERVER_IP -p 443 -m aes-256-gcm -k YOUR_PASSWORD -b 127.0.0.1:1080";
#       Restart = "always";
#     };
#   };

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

    wireguard-tools
    proton-vpn
		# shadowsocks-rust
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
