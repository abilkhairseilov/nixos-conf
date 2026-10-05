{ config, lib, pkgs, ... }:

{

  services = {
    xserver = {
      enable = true;
      xkb.options = "ctrl:nocaps";
    };

    displayManager.ly.enable = true;

    cloudflare-warp.enable = true;
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

    # editors
    neovim
    yazi
		tree-sitter

		
    kdePackages.kdeconnect-kde

    easyeffects
    pavucontrol

    dbus

    tailscale
    snapper

    ntfs3g
    usbutils

    wireguard-tools
    proton-vpn
  ];

  # security.pam.service = {
  #   gdm.enableGnomeKeyring = true;
  # };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
    config.hyprland.default = ["hyprland" "gtk" ];
  };

  programs = {
		hyprland = {
			enable = true;
			xwayland.enable = true;
		};
    appimage = {
      enable = true;
      binfmt = true;
    };
		steam = {
			enable = true;
			remotePlay.openFirewall = true;
		};
  };

}
