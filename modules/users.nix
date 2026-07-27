{ config, lib, pkgs, ... }:

{
  users.users.zhori = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "input" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
