{
  config,
  lib,
  pkgs,
  ...
}:

{

  networking = {
    networkmanager.enable = true;
    firewall.checkReversePath = false;
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };

  services = {
    cloudflare-warp.enable = true;
    tailscale = {
      enable = true;
    };

    snapper = {
      configs = {
        home = {
          SUBVOLUME = "/home";
          TIMELINE_CREATE = true;
          TIMELINE_CLEANUP = true;
        };
      };
    };

    gvfs.enable = true;
    udisks2.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };

    gnome.gnome-keyring.enable = true;
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
