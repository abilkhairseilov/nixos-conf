{ config, lib, pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;



    extraConfig =
    let
      cursorTheme = config.home.pointerCursor.name;
      cursorSize = config.home.pointerCursor.size;
    in ''
      input type:keyboard {
        xkb_options ctrl:nocaps
      }

      seat * xcursor_theme ${cursorTheme} ${cursorSize}
    '';

    extraSessionCommands =''
      export QT_QPA_PLATFORM=wayland
      export XDG_CURRENT_DESKTOP=sway
    '';

    systemd.variables = [ "-all" ];
    
  };
  xdg.configFile."sway/config".source = pkgs.lib.mkOverride 0 ./sway/config;

  home.packages = with pkgs; [
    swayosd
    swaylock-effects
  ];
}
