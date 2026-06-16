{ config, lib, pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;
    wrapperFeatures.gtk = true;

    extraSessionCommands = ''
      export QT_QPA_PLATFORM=wayland
      export XDG_CURRENT_DESKTOP=sway
    '';

    systemd.variables = [ "-all" ];

    config = {
      modifier = "Mod4";
      terminal = "kitty";
      menu = "noctalia-shell ipc call launcher toggle";

      fonts = {
        names = [ "JetBrainsMono Nerd Font" ];
        size = 10.0;
      };

      gaps = {
        inner = 10;
      };

      #defaultBorder = "pixel 2";

      focus = {
        followMouse = true;
        mouseWarping = false;
      };

      colors = {
        unfocused = {
          border      = "#2e3440";
          background  = "#3b4252";
          text        = "#d8dee9";
          indicator   = "#2e9ef4";
          childBorder = "#2e3440";
        };
        focused = {
          border      = "#afd2e9";
          background  = "#81a1c1";
          text        = "#eceff4";
          indicator   = "#2e9ef4";
          childBorder = "#afd2e9";
        };
      };

      input = {
        "type:keyboard" = {
          xkb_options = "ctrl:nocaps";
        };
        "type:touchpad" = {
          pointer_accel    = "0.5";
          dwt              = "enabled";
          tap              = "enabled";
          natural_scroll   = "enabled";
          middle_emulation = "enabled";
        };
      };

      output = {
        "eDP-1" = {
          pos   = "1920 0";
          scale = "1.25";
        };
        "HDMI-A-1" = {
          pos   = "0 0";
          scale = "1";
        };
      };

      workspaceOutputAssign = [
        { workspace = "1";  output = "HDMI-A-1"; }
        { workspace = "2";  output = "HDMI-A-1"; }
        { workspace = "3";  output = "HDMI-A-1"; }
        { workspace = "4";  output = "eDP-1"; }
        { workspace = "5";  output = "eDP-1"; }
        { workspace = "6";  output = "eDP-1"; }
        { workspace = "7";  output = "eDP-1"; }
        { workspace = "8";  output = "eDP-1"; }
        { workspace = "9";  output = "eDP-1"; }
        { workspace = "10"; output = "eDP-1"; }
      ];

      keybindings =
        let
          mod             = "Mod4";
					alt							= "Mod1";
          noctalia        = "noctalia-shell ipc call";
        in lib.mkOptionDefault {
          # Applications
          "${mod}+Return"      = "exec kitty";
          "${mod}+Shift+e"     = "exec emacsclient -c";
          "${mod}+q"           = "kill";
          "${mod}+d"           = "exec ${noctalia} launcher toggle";
          "${mod}+e"           = "exec pcmanfm-qt";
          "${mod}+l"           = "exec ${noctalia} lockScreen lock";
          "${mod}+x"           = "exec ${noctalia} sessionMenu toggle";
          "${mod}+b"           = "exec ${noctalia} bluetooth togglePanel";
          "${mod}+n"           = "exec ${noctalia} notifications toggleHistory";
          "${mod}+s"           = "exec ${noctalia} controlCenter toggle";
          "${mod}+z"           = "exec woomer";
					"${alt}+Space"			 = "exec vicinae toggle";

          # Focus
          "${mod}+Left"        = "focus left";
          "${mod}+Down"        = "focus down";
          "${mod}+Up"          = "focus up";
          "${mod}+Right"       = "focus right";

          # Move
          "${mod}+Shift+Left"  = "move left";
          "${mod}+Shift+Down"  = "move down";
          "${mod}+Shift+Up"    = "move up";
          "${mod}+Shift+Right" = "move right";

          # Workspaces — switch
          "${mod}+1"           = "workspace number 1";
          "${mod}+2"           = "workspace number 2";
          "${mod}+3"           = "workspace number 3";
          "${mod}+4"           = "workspace number 4";
          "${mod}+5"           = "workspace number 5";
          "${mod}+6"           = "workspace number 6";
          "${mod}+7"           = "workspace number 7";
          "${mod}+8"           = "workspace number 8";
          "${mod}+9"           = "workspace number 9";
          "${mod}+0"           = "workspace number 10";

          # Workspaces — move container
          "${mod}+Shift+1"     = "move container to workspace number 1";
          "${mod}+Shift+2"     = "move container to workspace number 2";
          "${mod}+Shift+3"     = "move container to workspace number 3";
          "${mod}+Shift+4"     = "move container to workspace number 4";
          "${mod}+Shift+5"     = "move container to workspace number 5";
          "${mod}+Shift+6"     = "move container to workspace number 6";
          "${mod}+Shift+7"     = "move container to workspace number 7";
          "${mod}+Shift+8"     = "move container to workspace number 8";
          "${mod}+Shift+9"     = "move container to workspace number 9";
          "${mod}+Shift+0"     = "move container to workspace number 10";

          # Layout
          "${mod}+h"           = "splith";
          "${mod}+j"           = "splitv";
          "${mod}+f"           = "fullscreen";
          "${mod}+Shift+space" = "floating toggle";
          "${mod}+space"       = "focus mode_toggle";
          "${mod}+a"           = "focus parent";
          "${mod}+r"           = "mode resize";

          # Scratchpad
          "${mod}+Shift+minus" = "move scratchpad";
          "${mod}+minus"       = "scratchpad show";

          # Reload
          "${mod}+Shift+c"     = "reload";

          # Panic: move external workspaces to laptop
          "${mod}+Shift+u"     = "move workspace to output eDP-1";

          # Media keys
          "XF86AudioRaiseVolume"  = "exec ${noctalia} volume increase";
          "XF86AudioLowerVolume"  = "exec ${noctalia} volume decrease";
          "XF86AudioMute"         = "exec ${noctalia} volume muteOutput";
          "XF86AudioMicMute"      = "exec ${noctalia} volume muteInput";
          "XF86MonBrightnessUp"   = "exec ${noctalia} brightness increase";
          "XF86MonBrightnessDown" = "exec ${noctalia} brightness decrease";

          # Screenshot
          "Print" = "exec grim -g \"$(slurp)\" - | satty --filename -";
        };

      modes = {
        resize = {
          Left   = "resize shrink width 10px";
          Down   = "resize grow height 10px";
          Up     = "resize shrink height 10px";
          Right  = "resize grow width 10px";
          Return = "mode default";
          Escape = "mode default";
        };
      };

      floating = {
        criteria = [
          { window_type = "dialog"; }
          { window_role = "dialog"; }
        ];
      };

      startup = [
        { command = "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP"; }
        { command = "systemctl --user import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP"; }
        { command = "keepassxc --minimized"; }
        { command = "emacs --daemon"; }
        { command = "easyeffects -w"; }
        { command = "wl-paste --type text --watch cliphist store"; }
        { command = "wl-paste --type image --watch cliphist store"; }
        {
          command = ''
            swayidle -w \
              before-sleep 'noctalia-shell ipc call lockScreen lock' \
              timeout 300 'noctalia-shell ipc call lockScreen lock' \
              timeout 480 'systemctl suspend'
          '';
        }
        { command = "noctalia-shell"; }
        { command = "vicinae server"; }
      ];
      bars = [];
    };

    extraConfig =
      let
        cursorTheme = config.home.pointerCursor.name;
        cursorSize  = config.home.pointerCursor.size;
      in ''
        seat * xcursor_theme ${cursorTheme} ${toString cursorSize}

        # Gestures
        bindgesture swipe:right workspace prev
        bindgesture swipe:left workspace next

        # SwayFX
        corner_radius 12
        default_border pixel 2

        # Noctalia include
        include ~/.config/sway/noctalia
      '';
  };

  home.packages = with pkgs; [
    swayfx
    grim
    slurp
    satty
    cliphist
    wl-clipboard
    swayidle
    woomer
  ];
}
