{ pkgs, inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    settings = {
      settingsVersion = 0;
      bar = {
        barType = "floating";
        position = "top";
        monitors = [ ];
        density = "default";
        contentPadding = 4;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              colorizeDistroLogo = false;
              colorizeSystemIcon = "none";
              customIconPath = "";
              enableColorization = true;
              icon = "noctalia";
              useDistroLogo = true;
            }
            {
              id = "Workspace";
              characterCount = 1;
              colorizeIcons = true;
              emptyColor = "secondary";
              enableScrollWheel = true;
              focusedColor = "primary";
              followFocusedScreen = false;
              groupedBorderOpacity = 1;
              hideUnoccupied = false;
              iconScale = 0.8;
              labelMode = "name";
              occupiedColor = "secondary";
              pillSize = 0.75;
              showApplications = false;
              showBadge = true;
              showLabelsOnlyWhenOccupied = true;
              unfocusedIconsOpacity = 1;
            }
          ];
          center = [
            {
              id = "ActiveWindow";
              colorizeIcons = false;
              hideMode = "transparent";
              maxWidth = 145;
              scrollingMode = "hover";
              showIcon = true;
              textColor = "none";
              useFixedWidth = false;
            }
          ];
          right = [
            {
              id = "Tray";
              blacklist = [ ];
              chevronColor = "none";
              colorizeIcons = true;
              drawerEnabled = true;
              hidePassive = false;
              pinned = [ ];
            }
            {
              id = "plugin:privacy-indicator";
              defaultSettings = {
                activeColor = "primary";
                enableToast = true;
                hideInactive = false;
                iconSpacing = 4;
                inactiveColor = "none";
                micFilterRegex = "";
                removeMargins = false;
              };
            }
            {
              id = "plugin:clipper";
              defaultSettings = {
                enableTodoIntegration = false;
                notecardsEnabled = true;
                pincardsEnabled = true;
                position = "Bottom";
                showCloseButton = false;
              };
            }
            {
              id = "Bluetooth";
              displayMode = "onhover";
              iconColor = "none";
              textColor = "none";
            }
            {
              id = "Network";
              displayMode = "onhover";
              iconColor = "none";
              textColor = "none";
            }
            {
              id = "Volume";
              displayMode = "onhover";
              iconColor = "none";
              middleClickCommand = "pwvucontrol || pavucontrol";
              textColor = "none";
            }
            {
              id = "Battery";
              deviceNativePath = "__default__";
              displayMode = "";
              hideIfIdle = false;
              hideIfNotDetected = true;
              showNoctaliaPerformance = false;
              showPowerProfiles = false;
            }
            {
              id = "Clock";
              clockColor = "none";
              customFont = "";
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              tooltipFormat = "HH:mm ddd, MMM dd";
              useCustomFont = false;
            }
          ];
        };
        screenOverrides = [ ];
      };
      general = {
        avatarImage = "/home/zhori/Pictures/Duster_-_Duster_front_cover.jpg";
        showScreenCorners = true;
        radiusRatio = 1.0;
        showHibernateOnLockScreen = true;
        lockScreenAnimations = false;
        enableLockScreenMediaControls = false;
        keybinds = {
          keyUp = [ "Up" ];
          keyDown = [ "Down" ];
          keyLeft = [ "Left" ];
          keyRight = [ "Right" ];
          keyEnter = [ "Return" ];
          keyEscape = [ "Esc" ];
          keyRemove = [ "Del" ];
        };
      };
      ui = {
        fontDefault = "Aporetic Serif";
        fontFixed = "Aporetic Serif Mono";
        fontDefaultScale = 1.1;
      };
      location = {
        name = "Doha, Qatar";
        weatherEnabled = true;
        weatherShowEffects = true;
        useFahrenheit = false;
        use12hourFormat = false;
        analogClockInCalendar = true;
      };
      colorSchemes = {
        darkMode = true;
      };
      templates = {
        activeTemplates = [
          {
            enabled = true;
            id = "emacs";
          }
          {
            enabled = true;
            id = "gtk";
          }
          {
            enabled = true;
            id = "qt";
          }
          {
            enabled = true;
            id = "sway";
          }
          {
            enabled = true;
            id = "labwc";
          }
          {
            enabled = true;
            id = "kitty";
          }
        ];
      };
      nightLight = {
        enabled = true;
        autoSchedule = true;
        nightTemp = "4000";
        dayTemp = "6500";
      };
      desktopWidgets = {
        enabled = true;
        overviewEnabled = true;
        gridSnap = true;
        monitorWidgets = [
          {
            name = "HDMI-A-1";
            widgets = [
              {
                id = "MediaPlayer";
                showVisualizer = true;
                x = 100;
                y = 200;
              }
              {
                id = "Weather";
                x = 100;
                y = 100;
              }
              {
                id = "Clock";
                clockStyle = "binary";
                format = "HH:mm\\nd MMMM yyyy";
                x = 100;
                y = 300;
              }
            ];
          }
          {
            name = "eDP-1";
            widgets = [
              {
                id = "Clock";
                clockStyle = "digital";
                format = "HH:mm\\nd MMMM yyyy";
                x = 1680;
                y = 860;
              }
            ];
          }
        ];
      };
    };
  };
}
