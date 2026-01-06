{ config, lib, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  services.printing.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # ram is quite tight, 8 gb wont cut it
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 12 * 1024;
  }];

  zramSwap = {
    enable = true;
    memoryPercent = 50;
    priority = 100;
    algorithm = "lz4";
  };

  services.earlyoom = {
    enable = true;
    freeMemThreshold = 5;
    freeSwapThreshold = 5;
  };

  security.polkit.enable = true;
}
