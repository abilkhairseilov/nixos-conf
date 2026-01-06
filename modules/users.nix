{ config, lib, pkgs, ... }:

{
  users.users.zhori = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
