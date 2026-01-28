{ config, lib, pkgs, ... }:

{
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.graphite-cursors;
    name = "graphite-dark-nord";
    size = 24;
  };

  gtk = {
		enable = true;
		theme = {
			name = "Nordic-darker";
      package = pkgs.nordic;
		};
    cursorTheme = {
      package = pkgs.graphite-cursors;
      name = "graphite-dark-nord";
      size = 24;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
	};
}
