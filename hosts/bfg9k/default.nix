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

  system.stateVersion = "25.11";
}
