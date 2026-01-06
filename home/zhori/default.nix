{ pkgs, ... }:

{
	home.username = "zhori";
	home.homeDirectory = "/home/zhori";

	home.stateVersion = "25.11";

	imports = [
		./shell.nix
		./waybar.nix
	];

	programs.zsh.enable = true;

	gtk = {
		enable = true;
		theme = {
			name = "Nordic-darker-v40";
			package = pkgs.arc-theme;
		};
	};

	home.packages = with pkgs; [
		firefox

		neovim
		vim
		emacs

		waybar
		wofi
		mako
		grim
		slurp
		wl-clipboard
		clipman
		wlogout
		swaybg

		kitty
		fzf
		zoxide

		texliveFull

		prismlauncher

		gnomeExtensions.user-themes
		gnomeExtensions.blur-my-shell
		gnome-tweaks

		arc-icon-theme
		nordic

	];


}
