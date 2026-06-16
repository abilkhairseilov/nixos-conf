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
			name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
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

    gtk4 = {
      theme = config.gtk.theme;
    };
	};
}
