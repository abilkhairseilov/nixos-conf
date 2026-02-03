{ config, pkgs, ... }:

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
  ];

  networking.hostName = "bfg9k";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  nixpkgs.config.allowUnfree = true;
  hardware.cpu.intel.updateMicrocode = true;

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

  powerManagement.enable = true;
  boot.kernelParams = ["resume_offset=16818176"];
  boot.resumeDevice = "/dev/disk/by-uuid/9847502b-880d-40d9-af61-402f40f2c744";

  system.stateVersion = "25.11";
}
