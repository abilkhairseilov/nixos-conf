{ pkgs, ... }:

{
	home.packages = [
		pkgs.libsForQt5.qt5ct
		pkgs.qt6Packages.qt6ct
	];

	qt = {
		enable = true;
		platformTheme.name = "qtct";
		style = {
			name = "kvantum";
			package = [
				pkgs.libsForQt5.qtstyleplugin-kvantum
				pkgs.qt6Packages.qtstyleplugin-kvantum
			];
		};
		kvantum = {
			enable = true;
			themes = [ pkgs.catppuccin-kvantum ];
			settings.General.theme = "catppuccin-frappe-blue";
		};
	};

	xdg.configFile = {
		"qt5ct/qt5ct.conf" = {
			force = true;
			text = ''
				[Appearance]
				color_scheme_path=/home/zhori/.config/qt5ct/colors/noctalia.conf
				custom_palette=true
				icon_theme=Papirus-Dark
				style=kvantum
			'';
		};
		"qt6ct/qt6ct.conf" = {
			force = true;
			text = ''
				[Appearance]
				color_scheme_path=/home/zhori/.config/qt6ct/colors/noctalia.conf
				custom_palette=true
				icon_theme=Papirus-Dark
				style=kvantum
			'';
		};
	};
}
