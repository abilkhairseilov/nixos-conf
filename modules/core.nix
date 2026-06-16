{ config, lib, pkgs, ... }:

{

  networking = {
   networkmanager.enable = true;
   firewall.checkReversePath = false;
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    gnome.gnome-keyring.enable = true;
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

}
