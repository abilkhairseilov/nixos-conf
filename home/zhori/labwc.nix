{ config, lib, pkgs, ... }:

let
  noctalia = "noctalia msg";
in
{
  wayland.windowManager.labwc = {
    enable = true;
    package = null;
    xwayland.enable = true;

    systemd.variables = [ "-all" ];

    environment = [
      "XDG_CURRENT_DESKTOP=labwc:wlroots"
      "XKB_DEFAULT_LAYOUT=us"
      "XKB_DEFAULT_OPTIONS=ctrl:nocaps"
      "QT_QPA_PLATFORM=wayland"
      "XCURSOR_THEME=${config.home.pointerCursor.name}"
      "XCURSOR_SIZE=${toString config.home.pointerCursor.size}"
    ];

    rc = {
      core = {
				gap = 10;
				allowTearing = true;
			};

      focus = {
        followMouse = true;
      };

      theme = {
        name = "noctalia";
        cornerRadius = 0;
        font = {
          "@name" = "JetBrainsMono Nerd Font";
          "@size" = "10";
        };
      };

      desktops = {
        "@number" = 10;
        names = {
          name = map toString (lib.range 1 10);
        };
      };

      keyboard = {
        default = true;
        keybind = [
          { "@key" = "W-Return";  action = { "@name" = "Execute"; "@command" = "kitty"; }; }
          { "@key" = "W-S-e";     action = { "@name" = "Execute"; "@command" = "emacsclient -c"; }; }
          { "@key" = "W-q";       action = { "@name" = "Close"; }; }
          { "@key" = "W-d";       action = { "@name" = "Execute"; "@command" = "${noctalia} panel-toggle launcher"; }; }
          { "@key" = "W-e";       action = { "@name" = "Execute"; "@command" = "pcmanfm-qt"; }; }
          { "@key" = "W-l";       action = { "@name" = "Execute"; "@command" = "${noctalia} session lock"; }; }
          { "@key" = "W-Escape";  action = { "@name" = "Execute"; "@command" = "${noctalia} panel-toggle session"; }; }
          { "@key" = "W-s";       action = { "@name" = "Execute"; "@command" = "${noctalia} panel-toggle control-center"; }; }
          { "@key" = "W-t";       action = { "@name" = "Execute"; "@command" = "kitty tmux-session-dispensary"; }; }
          { "@key" = "A-Space";   action = { "@name" = "Execute"; "@command" = "vicinae toggle"; }; }
        ] ++ (map (n: {
          "@key"  = "W-${toString n}";
          action = { "@name" = "GoToDesktop"; "@to" = toString n; };
        }) (lib.range 1 9)) ++ [
          { "@key" = "W-0";       action = { "@name" = "GoToDesktop"; "@to" = "10"; }; }
        ] ++ (map (n: {
          "@key"  = "W-S-${toString n}";
          action = { "@name" = "SendToDesktop"; "@to" = toString n; };
        }) (lib.range 1 9)) ++ [
          { "@key" = "W-S-0";     action = { "@name" = "SendToDesktop"; "@to" = "10"; }; }
        ] ++ [
					{ "@key" = "W-z";				action = { "@name" = "GoToDesktop"; "@to" = "left"; "@wrap" = "yes"; }; }
					{ "@key" = "W-x";				action = { "@name" = "GoToDesktop"; "@to" = "right"; "@wrap" = "yes"; }; }
					{ "@key" = "W-f";       action = { "@name" = "ToggleFullscreen"; }; }
          { "@key" = "W-r";       action = { "@name" = "Resize"; }; }
          { "@key" = "W-S-c";     action = { "@name" = "Reconfigure"; }; }
          { "@key" = "W-S-u";     action = { "@name" = "MoveToOutput"; "@output" = "eDP-1"; }; }
          { "@key" = "W-S-Left";  action = { "@name" = "MoveToEdge"; "@direction" = "left"; }; }
          { "@key" = "W-S-Right"; action = { "@name" = "MoveToEdge"; "@direction" = "right"; }; }
          { "@key" = "W-S-Up";    action = { "@name" = "MoveToEdge"; "@direction" = "up"; }; }
          { "@key" = "W-S-Down";  action = { "@name" = "MoveToEdge"; "@direction" = "down"; }; }
          { "@key" = "XF86AudioRaiseVolume";  action = { "@name" = "Execute"; "@command" = "${noctalia} volume-up"; }; }
          { "@key" = "XF86AudioLowerVolume";  action = { "@name" = "Execute"; "@command" = "${noctalia} volume-down"; }; }
          { "@key" = "XF86AudioMute";         action = { "@name" = "Execute"; "@command" = "${noctalia} volume-mute"; }; }
          { "@key" = "XF86AudioMicMute";      action = { "@name" = "Execute"; "@command" = "${noctalia} mic-mute"; }; }
          { "@key" = "XF86MonBrightnessUp";   action = { "@name" = "Execute"; "@command" = "${noctalia} brightness-up"; }; }
          { "@key" = "XF86MonBrightnessDown"; action = { "@name" = "Execute"; "@command" = "${noctalia} brightness-down"; }; }
          { "@key" = "Print";                 action = { "@name" = "Execute"; "@command" = "${noctalia} screenshot-region"; }; }
        ];
      };

      mouse = {
        default = true;
      };

      libinput = {
        device = {
          "@category" = "touchpad";
          naturalScroll    = "yes";
          tap              = "yes";
          middleEmulation = "yes";
          pointerSpeed     = "0.5";
          disableWhileTyping = "yes";
        };
      };
    };

    autostart = [
      "keepassxc --minimized &"
      "emacs --daemon &"
      "easyeffects -w &"
      "wl-paste --type text --watch cliphist store &"
      "wl-paste --type image --watch cliphist store &"
      "swayidle -w before-sleep 'noctalia msg session lock' timeout 300 'noctalia msg session lock' timeout 480 'systemctl suspend' &"
      "noctalia &"
      "vicinae server &"
      "libinput-gestures &"
    ];
  };

  xdg.configFile."libinput-gestures.conf".text = ''
    gesture swipe left   wtype -M logo -k x
    gesture swipe right  wtype -M logo -k z
    gesture swipe up     wtype -M logo -k d
    gesture swipe down   wtype -M logo -k s
  '';

  home.activation.labwcRcCleanup =
    lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
      if [ -e "$HOME/.config/labwc/rc.xml" ] && [ ! -L "$HOME/.config/labwc/rc.xml" ]; then
        rm -f "$HOME/.config/labwc/rc.xml"
      fi
    '';

  home.packages = with pkgs; [
    labwc
    grim
    slurp
    satty
    cliphist
    wl-clipboard
    swayidle
    woomer
    libinput-gestures
    wtype
  ];
}
