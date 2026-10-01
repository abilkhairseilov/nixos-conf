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
      nerd-fonts.bigblue-terminal

      font-awesome
			material-symbols

      aporetic

      noto-fonts
      noto-fonts-color-emoji
      corefonts
      vista-fonts
    ];
  };
}
