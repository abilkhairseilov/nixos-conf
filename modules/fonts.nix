{ config, lib, pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      nerd-fonts.adwaita-mono
      nerd-fonts.iosevka
      aporetic
      noto-fonts
      noto-fonts-color-emoji
      font-awesome
      corefonts
      vista-fonts
    ];
  };
}
