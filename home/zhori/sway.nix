{ config, lib, pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    extraConfig = ''
      input type:keyboard {
        xkb_options ctrl:nocaps
      }
    '';
  };
  xdg.configFile."sway/config".source = pkgs.lib.mkOverride 0 ./sway/config;

  home.packages = with pkgs; [
    swayosd
    swaylock-effects
  ];
}
