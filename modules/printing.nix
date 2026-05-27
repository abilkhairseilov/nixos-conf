{ config, lib, pkgs, ... }:

{
  services.printing.enable = true;
  services.avahi.enable = true; # Helps discover the printer on the network
  services.avahi.nssmdns4 = true;
  services.avahi.openFirewall = true;
}
