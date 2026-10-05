{ config, libs, pkgs, ...}:

{
	home.packages = with pkgs; [
      ## Basic cli tool
      ## inetutils: provides hostname, ifconfig, ping, etc.
      ## libnotify: provides notify-send
      inetutils libnotify

      ##### Other MISC #####
      # dbus xorg.xlsclients # some basic things
      kdePackages.kconfig # provide kwriteconfig6, used in install script


      ##### Not work, to be solved #####
      # hyprlock pamtester
      

      # NOTE: below are migrated from dist-arch. For each package, must know why it's needed and how it's used specifically, cuz things may be need tweak to properly use the package installed by Nix, for example those have hardcoded path /usr/* . See sdata/deps-info.md
      ### illogical-impulse-audio
      libcava #cava
      lxqt.pavucontrol-qt #pavucontrol-qt
      # wireplumber #wireplumber
      # pipewire #pipewire-pulse
      libdbusmenu-gtk3 #libdbusmenu-gtk3
      playerctl #playerctl


      ### illogical-impulse-backlight
      (geoclue2.override { withDemoAgent = true; }) #geoclue
      brightnessctl #brightnessctl
      ddcutil #ddcutil


      ### illogical-impulse-basic
      bc #bc
      uutils-coreutils-noprefix #coreutils
      cliphist #cliphist
      cmake #cmake
      # curlFull #curl
      wget #wget
      ripgrep #ripgrep
      jq #jq
      xdg-user-dirs #xdg-user-dirs
      rsync #rsync
      yq-go #go-yq


      ### illogical-impulse-bibata-modern-classic-bin
      bibata-cursors


      ### illogical-impulse-fonts-themes
      adw-gtk3 #adw-gtk-theme-git
      kdePackages.breeze kdePackages.breeze-icons #breeze
      #breeze-plus (TODO: Not available as nixpkg)
      # darkly darkly-qt5 #darkly-bin
      eza #eza
      #fish (Currently install via system PM; TODO: should install via nix in future when authentication problem fixed)
      fontconfig #fontconfig
      kitty #kitty (Used in fuzzel, Hyprland, kdeglobals and Quickshell config; kitty config is also included as dots)
      matugen #matugen-bin (Used in Quickshell)
      #otf-space-grotesk (TODO: Not available as Nixpkg)
      # starship #starship
      nerd-fonts.jetbrains-mono #ttf-jetbrains-mono-nerd
      material-symbols #ttf-material-symbols-variable-git
      #ttf-readex-pro (TODO: seems not available as nixpkg)
      rubik #ttf-rubik-vf
      twemoji-color-font #ttf-twemoji


      ### illogical-impulse-hyprland
      #hyprland
      hyprsunset #hyprsunset
      wl-clipboard #wl-clipboard

      kdePackages.dolphin

      ### illogical-impulse-kde
      # kdePackages.bluedevil #bluedevil
      #gnome-keyring #gnome-keyring (TODO: Install via system PM instead; should install via nix in future when authentication problem fixed)
      # networkmanager #networkmanager
      # kdePackages.plasma-nm #plasma-nm
      # #polkit-kde-agent (TODO: Install via system PM instead; should install via nix in future when authentication problem fixed)
      # # kdePackages.dolphin #dolphin
      # kdePackages.systemsettings #systemsettings

      
      ### illogical-impulse-microtex-git
      # TODO: Not available as nixpkg


      ### illogical-impulse-portal
      # xdg-desktop-portal ## (Included elsewhere)
      # xdg-desktop-portal-kde ## (Included elsewhere)
      # xdg-desktop-portal-gtk ## (Included elsewhere)
      # xdg-desktop-portal-hyprland ## (Included elsewhere)

      ### illogical-impulse-screencapture
      hyprshot #hyprshot
      grim
      slurp #slurp
      satty
      swappy #swappy
      tesseract #tesseract
      #tesseract-data-eng (TODO: Seems not available as nixpkg)
      wf-recorder #wf-recorder


      ### illogical-impulse-toolkit
      upower #upower
      wtype #wtype
      ydotool #ydotool


      ### illogical-impulse-widgets
      fuzzel #fuzzel
      glib #glib2
      imagemagick #imagemagick
      hypridle #hypridle
      #hyprlock (Should not be installed via Nix; TODO: should install via nix in future when authentication problem fixed)
      hyprpicker #hyprpicker
      songrec #songrec
      translate-shell #translate-shell
      wlogout #wlogout
      libqalculate #libqalculate

    ];

}
