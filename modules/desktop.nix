{ pkgs, ... }:

{

  services = {
    xserver = {
      enable = true;
      xkb.options = "ctrl:nocaps";
    };

    displayManager.ly.enable = true;
  };

  environment.systemPackages = with pkgs; [

    # editors
		tree-sitter

    easyeffects
    pavucontrol

    dbus

    ntfs3g
    usbutils

    wireguard-tools
    proton-vpn

		curlFull
		wget
		ripgrep
		fd
		tree
		jq
		btop
    zip
    unzip
  ];

  xdg.portal = {
    enable = true;
		config = {
			common = {
				default = [ "gtk" "kde" ];
			};
      hyprland = {
        default = [ "hyprland" "gtk" "kde" ];
      };
    };
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
    kdeconnect = {
      enable = true;
    };
    vim = {
      enable = true;
      package = pkgs.vim-full;
    };
		# steam = {
		# 	enable = true;
		# 	remotePlay.openFirewall = true;
		# };
  };

}
