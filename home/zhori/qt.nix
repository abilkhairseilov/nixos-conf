{ config, lib, pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    style.name = "fusion";
  };
  systemd.user.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
}
