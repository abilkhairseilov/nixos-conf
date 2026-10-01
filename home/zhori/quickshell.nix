{ inputs, pkgs, lib, ... }:

let
  qs = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default;

  qmlPackages = with pkgs; [
    # Required by end-4 QML
    kdePackages.kirigami.unwrapped

    qt6.qt5compat
    qt6.qtpositioning
    qt6.qtquicktimeline
    qt6.qtmultimedia
    qt6.qtsensors
    qt6.qtsvg
  ];

  qmlImportPath =
    lib.makeSearchPath "lib/qt-6/qml" qmlPackages;

  quickshellWrapped = pkgs.symlinkJoin {
    name = "quickshell-end4";
    meta.mainProgram = "qs";
    paths = [ qs ];

    nativeBuildInputs = [ pkgs.makeWrapper ];

    postBuild = ''
      for bin in quickshell qs; do
        if [ -e "$out/bin/$bin" ]; then
          wrapProgram "$out/bin/$bin" \
            --prefix QML_IMPORT_PATH : "${qmlImportPath}" \
            --prefix NIXPKGS_QT6_QML_IMPORT_PATH : "${qmlImportPath}" \
            --prefix XDG_DATA_DIRS : "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
        fi
      done
    '';
  };
in
{
  programs.quickshell = {
    enable = true;
    package = quickshellWrapped;
    systemd.enable = true;
  };

  home.packages = with pkgs; [
    # Frequently used by the actual shell
    jq
    curl
    brightnessctl
    playerctl
    wl-clipboard
    upower

    # Styling / generated theme
    matugen

    # Used by several shell functions
    imagemagick
    libqalculate

    # KDE-related helpers
    kdePackages.kdialog
    kdePackages.syntax-highlighting
  ];
}
