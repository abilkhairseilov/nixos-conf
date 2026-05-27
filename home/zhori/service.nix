{ config, lib, pkgs, ... }:

{
  services = {
    mpris-proxy.enable = true;
    syncthing = {
      enable = true;
    };
    gnome-keyring.enable = lib.mkForce false;
  };

}
