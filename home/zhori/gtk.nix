{ config, lib, pkgs, ... }:

{
  	gtk = {
		enable = true;
		theme = {
			name = "Nordic-darker";
      package = pkgs.nordic;
		};
    cursorTheme = {
      name = "Graphite-dark-nord";
      package = pkgs.graphite-cursors;
      size = 24;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
	};
}
