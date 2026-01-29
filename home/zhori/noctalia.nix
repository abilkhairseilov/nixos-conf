{ pkgs, inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        barType = "simple";
        position = "top";
        density = "mini";
        showCapsule = false;
        widgets = {
          left = [
            { id = "ControlCenter"; useDistroLogo = true; icon = "noctalia"; }
            {
              id = "Workspace";
              characterCount = 2;
              labelMode = "none";
              iconScale = 0.8;
              showBadge = true;
              showLabelsOnlyWhenOccupied = true;
              focusedColor = "primary";
              occupiedColor = "secondary";
              emptyColor = "secondary";
            }
          ];

          center = [
            { id = "ActiveWindow"; maxWidth = 250; hideMode = "transparent"; scrollingMode = "hover"; showIcon = true; useFixedWidth = true; }
          ];

          right = [
            { id = "Tray"; "colorizeIcons" = true; "drawerEnabled" = true; }
            { id = "plugin:privacy-indicator"; }
            { id = "plugin:clipper"; }
            { id = "Bluetooth"; displayMode = "onhover"; }
            { id = "Network"; displayMode = "onhover"; }
            { id = "Volume"; displayMode = "onhover"; middleClickCommand = "pwvucontrol || pavucontrol"; }
            { id = "Battery"; displayMode = "onhover"; hideIfNotDetected = true; warningThreshold = 30; }
            { id = "Clock"; formatHorizontal = "HH:mm"; formatVertical = "HH mm"; tooltipFormat = "HH:mm ddd, MMM dd"; usePrimaryColor = true; }
          ];
        };
      };

      general = {
        avatarImage = "/home/zhori/Pictures/Duster_-_Duster_front_cover.jpg";
        radiusRatio = 0.2;
        lockOnSuspend = true;
        showSessionButtonsOnLockScreen = true;
        showHibernateOnLockScreen = true;
        enableShadows = true;
      };

      ui = {
        fontDefault = "Aporetic Serif";
        fontFixed = "Aporetic Serif Mono";
        fontDefaultScale = 1.1;
        tooltipsEnabled = true;
        panelBackgroundOpacity = 0.93;
      };

      location = {
        name = "Doha, Qatar";
        weatherEnabled = true;
        showCalendarEvents = true;
        showCalendarWeather = true;
        analogClockInCalendar = true;
      };

      colorSchemes = {
        useWallpaperColors = true;
        predefinedScheme = "Monochrome";
        darkMode = true;
      };

      nightLight = {
        enabled = true;
        autoSchedule = true;
        nightTemp = "4000";
        dayTemp = "6500";
      };

      wallpaper = {
        enabled = true;
        directory = "/home/zhori/Pictures/Wallpapers";
        viewMode = "single";
        setWallpaperOnAllMonitors = true;
        fillMode = "crop";
        solidColor = "#1a1a2e";
        wallpaperChangeMode = "random";
        randomIntervalSec = 300;
      };

      desktopWidgets = {
        enabled = true;
        gridSnap = true;
        monitorWidgets = [
          {
            name = "HDMI-A-1";
            widgets = [
              { id = "MediaPlayer"; showVisualizer = true; x = 100; y = 200; }
              { id = "Weather"; x = 100; y = 100; }
              { id = "Clock"; clockStyle = "binary"; format = "HH:mm\\nd MMMM yyyy"; x = 100; y = 300; }
            ];
          }
          {
            name = "eDP-1";
            widgets = [
              { id = "Clock"; clockStyle = "digital"; format = "HH:mm\\nd MMMM yyyy"; x = 1680; y = 860; }
            ];
          }
        ];
      };
    };
  };
}
