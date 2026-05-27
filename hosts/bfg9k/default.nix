{ config, pkgs, ... }:

/*
Configuration for my HP Probook 440 G8 laptop
Specs:
CPU           11th Gen i7-1165G7
GPU           Intel Xeon (integrated graphics)
RAM           8 GB (7.44 GiB)
SSD           512 GB
*/

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core.nix
    ../../modules/users.nix
    ../../modules/nix.nix
    ../../modules/fonts.nix
    ../../modules/locale.nix
    ../../modules/desktop.nix
    ../../modules/development.nix
    ../../modules/printing.nix
  ];

  networking.hostName = "bfg9k";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  hardware = {
    cpu.intel.updateMicrocode = true;
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
      ];
    };
    bluetooth.enable = true;
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
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

  powerManagement.enable = true;

  services = {
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "auto";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
    earlyoom = {
      enable = true;
      freeMemThreshold = 5;
      freeSwapThreshold = 5;
    };
    thermald.enable = true;
    upower.enable = true;
  };

  boot.kernelParams = [ "resume_offset=16818176" "mem_sleep_default=s2idle" ];
  boot.resumeDevice = "/dev/disk/by-uuid/9847502b-880d-40d9-af61-402f40f2c744";

  system.stateVersion = "25.11";
}
