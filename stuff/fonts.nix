{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    fontconfig.defaultFonts = {
      sansSerif = [
        "Inter"
        "Readex Pro"
        "Noto Sans"
      ];

      serif = [ "Noto Serif" ];

      monospace = [
        "JetBrainsMono Nerd Font"
      ];

      emoji = [ "Twitter Color Emoji" ];
    };

    
    fontDir.enable = true;
    packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      nerd-fonts.adwaita-mono
      nerd-fonts.iosevka
      nerd-fonts.bigblue-terminal

      inter # google sans flex isnt available in Nixpkgs
      material-symbols
      rubik
      twemoji-color-font
      (google-fonts.override {
        fonts = [
          "ReadexPro"
          "SpaceGrotesk"
        ];
      })
      noto-fonts
      dejavu_fonts
      hack-font
      liberation_ttf
      freefont_ttf

      font-awesome
      material-symbols
      google-fonts

      aporetic

      noto-fonts
      noto-fonts-color-emoji
      corefonts
      vista-fonts
    ];
  };
}
