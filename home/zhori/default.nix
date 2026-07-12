{ pkgs, inputs, ... }:

let
  env = import ./env.nix;
  getPkg = app: pkgs.${app.pkg};

  defaultAppPkgs = builtins.map getPkg (builtins.attrValues env.defaultApps);
in
{
	home.username = "zhori";
	home.homeDirectory = "/home/zhori";

	home.stateVersion = "25.11";

	imports = [
		./shell.nix
    ./tmux.nix
    ./kitty.nix
    ./sway.nix
    ./gtk.nix
    ./qt.nix
    ./noctalia.nix
    ./service.nix
    ./xdg-entries.nix
    ./git.nix
		./pywalfox.nix
	];

	programs.zsh.enable = true;

	home.packages = with pkgs; [

    firefox
		pywalfox-native
    vesktop
		signal-desktop

    neovim
    yazi
		tree-sitter
    emacs-pgtk

		obsidian
		zotero

    kanshi
    blueman
    woomer

		kitty
		fzf
		zoxide
    fastfetch
		vicinae

		prismlauncher
    apotris

		codex
		opencode

    kdePackages.okular
    darktable
    cheese

    picard
    anki-bin

    syncthing
    keepassxc
	] ++ defaultAppPkgs;

	xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # File Manager for directories
      "inode/directory" = [ "pcmanfm-qt.desktop" ];
      
      # Image Viewer for common formats
      "image/jpeg" = [ "nomacs.desktop" ];
      "image/png" = [ "nomacs.desktop" ];
      "image/gif" = [ "nomacs.desktop" ];
      "image/webp" = [ "nomacs.desktop" ];
      "image/bmp" = [ "nomacs.desktop" ];
      "image/tiff" = [ "nomacs.desktop" ];
    };
  };
}
