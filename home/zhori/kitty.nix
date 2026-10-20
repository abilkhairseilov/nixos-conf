{ config, lib, ... }:

{
  programs.kitty = lib.mkForce {
    enable = true;

    extraConfig = ''
      include ${config.home.homeDirectory}/.local/state/quickshell/user/generated/terminal/kitty-theme.conf
      font_family                 BigBlueTerm437 Nerd Font Mono
      font_size                   14
      initial_window_width        80c
      initial_window_height       24c
      scrollback_lines            2000
      wheel_scroll_min_lines      1
      enable_audio_bell           false
      window_padding_width        10
      hide_window_decorations     true
      background_opacity          0.7
      confirm_os_window_close     0
      cursor_trail 1
    '';
  };
	# xdg.configFile."kitty/current_theme.conf".source = "${config.home.homeDirectory}/.local/state/quickshell/user/generated/terminal/kitty-theme.conf";
}
