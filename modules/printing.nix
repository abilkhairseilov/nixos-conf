{ config, lib, pkgs, ... }:

{
  services = {
    printing.enable = true;
    avahi = {
      enable = true; # Helps discover the printer on the network
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
