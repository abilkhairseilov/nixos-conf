{ pkgs, ... }:

{
	home.username = "zhori";
	home.homeDirectory = "/home/zhori";

	home.stateVersion = "25.11";

  services = {
    mpris-proxy.enable = true;
  };

	imports = [
		./shell.nix
		./waybar.nix
    ./kitty.nix
    ./sway.nix
    ./gtk.nix
    ./noctalia.nix
    ./scripts.nix
	];

	programs.zsh.enable = true;

	home.packages = with pkgs; [
		firefox
    vesktop

		neovim
		vim
		emacs-pgtk

		waybar
		wofi
		grim
    slurp
    satty
    flameshot
    kanshi
		wl-clipboard
		cliphist
		wlogout
    waypaper
		swaybg
    swaynotificationcenter
    nwg-drawer
    nwg-panel
    nwg-look
    pcmanfm
    blueman

		kitty
		fzf
		zoxide
    fastfetch

		prismlauncher
    apotris

    kdePackages.okular

		gnomeExtensions.user-themes
		gnomeExtensions.blur-my-shell
		gnome-tweaks

	];
}
