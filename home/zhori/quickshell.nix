{ inputs, pkgs, lib, ... }:

{
  programs.quickshell = {
    enable = true;
    systemd.enable = true;
  };

	home.packages = with pkgs; [
      quickshell
      matugen
      kdePackages.kdialog
			kdePackages.konsole
      hyprpicker
      mpvpaper
      ffmpeg
      python3
      python3Packages.pillow

      # Runtime tools called by ii modules and hyprland binds
      grim            # screenshots (ScreenshotAction.qml, Recorder.qml)
      slurp           # region selection (ScreenshotAction.qml)
      swappy          # screenshot editor (TempScreenshotProcess.qml)
      wf-recorder     # screen recording (Recorder.qml, record.sh)
      cliphist        # clipboard history (Cliphist.qml, autostart.lua)
      playerctl       # media keys (binds.lua, MprisController.qml)
      tesseract       # OCR (ScreenshotAction.qml)
      brightnessctl   # brightness keys (binds.lua, Brightness.qml)
      ddcutil         # monitor brightness fallback (Brightness.qml)
			nwg-displays		# monitor management

      # Fonts required by end4's config
      material-symbols
      nerd-fonts.jetbrains-mono
      twemoji-color-font

      # GSettings for GTK apps (LibreWolf, etc.)
      glib
      gsettings-desktop-schemas

      # For xdg-user-dir (needed by switchwall.sh's Choose file)
      xdg-user-dirs

      # Qt6 modules required by end4's config
      qt6.qtbase
      qt6.qtdeclarative
      qt6.qtpositioning
      qt6.qtlocation
      qt6.qtquicktimeline
      qt6.qtsensors
      qt6.qtimageformats
      qt6.qt5compat
      qt6.qtmultimedia
      qt6.qtsvg
      qt6.qttools
      qt6.qttranslations
      qt6.qtvirtualkeyboard
      kdePackages.qtwayland
      kdePackages.kirigami.unwrapped
      kdePackages.syntax-highlighting
			kdePackages.plasma-browser-integration
    ];

}
