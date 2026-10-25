{ pkgs, ... }:

{
	home.username = "zhori";
	home.homeDirectory = "/home/zhori";

	home.stateVersion = "25.11";

	imports = [
		./shell.nix
		./kitty.nix
    ./gtk.nix
    ./service.nix
		./git.nix
		./pywalfox.nix
    ./tmux.nix
		./tmux-session-dispensary.nix
		./games.nix
		./hypr.nix
		./quickshell.nix
		./chatgpt.nix
		./emacs.nix
	];

	home.packages = with pkgs; [

    firefox
    vesktop

    helix # helix is the new cool kid in the town
    
		obsidian
		zotero
		sioyek

		krita
		upscayl
		nomacs
		vlc

    kanshi
    blueman

		kitty
		fzf
		zoxide
    fastfetch
		vicinae

		codex
		opencode

    kdePackages.okular
    darktable
    cheese

    picard
    anki-bin

    syncthing
    keepassxc

		mpv
    mpv-handler

    kdePackages.ark
	];
	xdg = {
		mimeApps = {
			enable = true;

			defaultApplications = {
				#pdfs
				"application/pdf" = [ "sioyek.desktop" ];

				# images
				"image/png" = [ "org.nomacs.ImageLounge.desktop" ];
				"image/jpeg" = [ "org.nomacs.ImageLounge.desktop" ];
				"image/gif" = [ "org.nomacs.ImageLounge.desktop" ];
				"image/webp" = [ "org.nomacs.ImageLounge.desktop" ];
				"image/bmp" = [ "org.nomacs.ImageLounge.desktop" ];
				"image/tiff" = [ "org.nomacs.ImageLounge.desktop" ];
				"image/svg+xml" = [ "org.nomacs.ImageLounge.desktop" ];

				"inode/directory" = ["org.kde.dolphin.desktop"];
			};

			# just in case
			associations.added = {
				"application/pdf" = [ "sioyek.desktop" ];

				"image/png" = [ "org.nomacs.ImageLounge.desktop" ];
				"image/jpeg" = [ "org.nomacs.ImageLounge.desktop" ];
				"image/gif" = [ "org.nomacs.ImageLounge.desktop" ];
				"image/webp" = [ "org.nomacs.ImageLounge.desktop" ];
				"image/bmp" = [ "org.nomacs.ImageLounge.desktop" ];
				"image/tiff" = [ "org.nomacs.ImageLounge.desktop" ];
				"image/svg+xml" = [ "org.nomacs.ImageLounge.desktop" ];
			};
		};
	};
}
