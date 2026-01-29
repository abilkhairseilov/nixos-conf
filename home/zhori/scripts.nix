{ config, lib, pkgs, ... }:
let
  envVars = import ./env.nix;
  launcher-script = pkgs.writeShellScriptBin "launcher-script" ''
          ${pkgs.procps}/bin/pgrep -x  "${envVars.launcher.name}" > /dev/null
          if [ $? != 0 ] ; then
            ${pkgs.${envVars.launcher.pkg}}/bin/${envVars.launcher.name} ${envVars.launcher.args} &
          fi
        '';
  bt-toggle = pkgs.writeShellScriptBin "bt-toggle" ''
  #!/usr/bin/env sh
  powered="$(bluetoothctl show | grep -q "Powered: yes" && echo yes || echo no)"

  if [ "$powered" = "yes" ]; then
      bluetoothctl power off
  else
      bluetoothctl power on
  fi
  '';
in
{
  home.packages = [ launcher-script bt-toggle ];
}
