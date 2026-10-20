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

    printing.enable = true;
    avahi = {
      enable = true; # Helps discover the printer on the network
      nssmdns4 = true;
      openFirewall = true;
    };

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

  xdg.portal = {
    enable = true;
		config = {
			common = {
				default = [ "gtk" "kde" ];
			};
		};
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk pkgs.kdePackages.xdg-desktop-portal-kde ];
    config.hyprland.default = [ "hyprland" "gtk" "kde" ];
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
