{ config, lib, pkgs, ... }:

{
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      font_family                 = "Iosevka Nerd Font Mono";
      font_size                   = 14;

      initial_window_width        = "80c";
      initial_window_height       = "24c";
      scrollback_lines            = 2000;
      wheel_scroll_min_lines      = 1;
      enable_audio_bell           = false;
      window_padding_width        = 10;
      hide_window_decorations     = true;
      background_opacity          = "0.7";
      dynamic_background_opacity  = true;
      confirm_os_window_close     = 0;

      # Animated cursor follows text
      cursor_trail = 1;

      extraConfig = ''
        include ${config.home.homeDirectory}/.config/kitty/themes/noctalia.conf
      '';
    };
  };
	# xdg.configFile."kitty/themes/noctalia.conf".source = "~/.config/kitty/themes/noctalia.conf";
}
