{ pkgs, inputs, ... }:

let
  env = import ./env.nix;
  getPkg = app: pkgs.${app.pkg};
in
{
	home.username = "zhori";
	home.homeDirectory = "/home/zhori";

	home.stateVersion = "25.11";

	imports = [
		./shell.nix
    ./kitty.nix
    ./sway.nix
    ./gtk.nix
    ./qt.nix
    ./noctalia.nix
    ./service.nix
    ./xdg-entries.nix
    ./git.nix
	];

	programs.zsh.enable = true;

	home.packages = with pkgs; [
    (getPkg env.defaultApps.launcher)
    (getPkg env.defaultApps.fileManager)
    (getPkg env.defaultApps.imageViewer)
    (getPkg env.defaultApps.archiveManager)
    (getPkg env.defaultApps.documentViewer)
    (getPkg env.defaultApps.videoPlayer)

    firefox
    vesktop
		signal-desktop

    neovim
    tmux
    yazi
		tree-sitter
    emacs-pgtk

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
    t3code

    kdePackages.okular
    darktable
    cheese

    picard
    anki-bin

    syncthing
    keepassxc
	];

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
