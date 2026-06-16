{ config, lib, pkgs, ... }:

{
	services = {
		mpris-proxy.enable = true;
		syncthing = {
			enable = true;
		};
		gnome-keyring.enable = lib.mkForce false;
	};
	systemd.user.services.polkit-gnome-authentication-agent-1 = {
		Unit = {
			Description = "polkit-gnome-authentication-agent-1";
			Wants = [ "graphical-session.target" ];
			After = [ "graphical-session.target" ];
		};
		Install = {
			WantedBy = [ "graphical-session.target" ];
		};
		Service = {
			Type = "simple";
			ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
			Restart = "on-failure";
			RestartSec = 1;
			TimeoutStopSec = 10;
		};
	};

}
