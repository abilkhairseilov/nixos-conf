{ config, lib, pkgs, ... }:

{
	home.sessionVariables.GTK_THEME = "adw-gtk3-dark";

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
      theme = null;
    };
	};
	qt = {
		enable = true;
		platformTheme.name = "kde";
		style.name = "breeze";
	};
}
