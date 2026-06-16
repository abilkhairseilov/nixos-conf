{ config, lib, pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
  };
  systemd.user.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "kvantum";
  };
}
