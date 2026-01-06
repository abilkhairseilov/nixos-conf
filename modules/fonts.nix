{ config, lib, pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-color-emoji
      font-awesome
      corefonts
      vista-fonts
    ];
  };
}
