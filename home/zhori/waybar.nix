{config, pkgs, ...}:

{
	programs.waybar = {
    enable = true;
  };

  systemd.user.services.waybar = {
  Unit = {
    Description = "Waybar";
    After = [
      "graphical-session.target"
      "pipewire.service"
      "wireplumber.service"
      "network-manager.service"
      "bluetooth.service"
    ];
    PartOf = [ "graphical-session.target" ];
  };

  Service = {
    ExecStart = "${pkgs.waybar}/bin/waybar";
    Restart = "on-failure";
    Environment = [
      "XDG_CURRENT_DESKTOP=sway"
    ];
  };

  Install = {
    WantedBy = [ "graphical-session.target" ];
  };
};


	programs.waybar.settings = {
		mainBar = {
			layer = "top";
			position = "top";
			height = 32;

			modules-left = [ "custom/logo" "sway/workspaces" "sway/mode" ];
			modules-center = [ "window" ];
			modules-right = [ "tray" "power-profiles-daemon" "network" "wireplumber" "bluetooth" "battery" "clock" "custom/notification" ];

			"custom/logo" = {
				format = "";
				tooltip = false;
				on-click = ''wofi --show drun '';
			};

			"custom/notification" = {
				tooltip = true;
				format = "<span size='16pt'>{icon}</span>";
				format-icons = {
					notification = "󱅫";
					none = "󰂜";
					dnd-notification = "󰂠";
					dnd-none = "󰪓";
					inhibited-notification = "󰂛";
					inhibited-none = "󰪑";
					dnd-inhibited-notification = "󰂛";
					dnd-inhibited-none = "󰪑";
				};
				return-type = "json";
				exec-if = "which swaync-client";
				exec = "swaync-client -swb";
				on-click = "swaync-client -t -sw";
				on-click-right = "swaync-client -d -sw";
				escape = true;
			};

			"sway/workspaces" = {
				disable-scroll = true;
				all-outputs = true;
				persistent_workspaces = {
					"1" = [];
					"2" = [];
					"3" = [];
					"4" = [];
				};
				disable-click = false;
			};

			"sway/mode" = {
				tooltip = false;
			};

			"clock" = {
				interval = 60;
				format = "{:%a %d/%m %H:%M}";
			};

			"wireplumber" = {
				format = "{icon} {volume}%";
				format-muted = " muted";
				format-source = " {source_volume}%";
				format-source-muted = " muted";

				format-icons = {
					default = [ "" "" ];
					muted = "";
				};

				on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
			};

			"battery" = {
				format = "{icon} {capacity}%";
				format-charging = "󰂄 {capacity}%";
				format-plugged = "󰂄 {capacity}%";
				format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
				tooltip = false;
			};

			"bluetooth" = {
				format = " {status}";
				format-connected = " {device_alias}";
				format-disabled = " Off";
				on-click = "bt-toggle";
				on-click-right = "blueman-manager";
				tooltip = true;
				tooltip-format-enumerate-connected = "{device_alias}: {device_battery_percentage}";
			};

			"power-profiles-daemon" = {
				format = "{icon} {profile}";
				tooltip-format = "Power profile: {profile}\nDriver: {driver}";
				tooltip = true;
				format-icons = {
					default =  "";
					performance = "";
					balanced = "";
					power-saver = "";
				};
			};

			"tray" = {
				spacing = 10;
				icons = {
					"blueman" = "bluetooth";
				};
			};
		};
	};



	programs.waybar.style = ''
		/* -----------------------------------------------------
		 * Colors
		 * ----------------------------------------------------- */

		@define-color icon_color #afd2e9;
	@define-color background #141318;
	@define-color on_primary_container #afd2e9;
	@define-color error #bf616a;

	/* -----------------------------------------------------
	 * Global
	 * ----------------------------------------------------- */

	* {
		font-family: "JetBrainsMono Nerd Font Mono", "Font Awesome 7 Free";
border: none;
	border-radius: 0;
	min-height: 0;
	}

	window#waybar {
		background-color: rgba(0,0,0,0.4);
		border-bottom: 4px;
		border-bottom-color: @icon_color;
	}

	/* -----------------------------------------------------
	 * Layout
	 * ----------------------------------------------------- */

	.modules-left {
margin: 0 0 0 10px;
	}

	.modules-right {
margin: 0 10px 0 0;
	}

	/* -----------------------------------------------------
	 * Shared text-only module style
	 * ----------------------------------------------------- */

#custom-logo,
#sway-mode,
#power-profiles-daemon,
#clock,
#battery,
#bluetooth,
#custom-notification,
#network,
#wireplumber,
#window {
background: transparent;
color: @icon_color;
padding: 0 8px;
margin: 0 2px;
	font-size: 14px;
transition: color 0.1s linear;
}

/* -----------------------------------------------------
 * Logo
 * ----------------------------------------------------- */

#custom-logo {
	font-size: 20px;
	padding-right: 10px;
}

/* -----------------------------------------------------
 * Workspaces (text-only)
 * ----------------------------------------------------- */

#workspaces {
background: transparent;
padding: 0;
margin: 0 10px 0 0;
	font-weight: 600;
}

#workspaces button {
background: transparent;
color: @icon_color;
padding: 0 6px;
margin: 0 2px;
}

#workspaces button.active {
color: @on_primary_container;
       font-weight: 700;
}

#workspaces button:hover {
color: @on_primary_container;
}

/* -----------------------------------------------------
 * Sway mode (subtle emphasis)
 * ----------------------------------------------------- */

#sway-mode {
	font-weight: 600;
color: @on_primary_container;
}

/* -----------------------------------------------------
 * Power profiles
 * ----------------------------------------------------- */

#power-profiles-daemon {
	font-size: 14px;
}

/* -----------------------------------------------------
 * Clock
 * ----------------------------------------------------- */

#clock {
	font-size: 14px;
}

/* -----------------------------------------------------
 * Battery
 * ----------------------------------------------------- */

#battery {
	font-size: 14px;
}

#battery.charging,
#battery.plugged {
color: @on_primary_container;
}

#battery.critical:not(.charging) {
color: @error;
}

/* -----------------------------------------------------
 * Tray
 * ----------------------------------------------------- */

#tray {
padding: 6px;
}

#tray > .item {
padding: 2px;
}

#tray > .passive {
	-gtk-icon-effect: dim;
}

#tray > .needs-attention {
	-gtk-icon-effect: highlight;
}

/* -----------------------------------------------------
 * Tooltips
 * ----------------------------------------------------- */

tooltip {
	background-color: @background;
padding: 6px;
	 border-radius: 6px;
}

tooltip label {
color: @icon_color;
}


'';
}
