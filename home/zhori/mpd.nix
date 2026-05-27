{ config, pkgs, ... }:

{
  # Enable the MPD service module
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";

    # Optional: Automatically start when you login
    # network.startWhenNeeded = true;

    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
    '';
  };
  home.packages = [ pkgs.rmpc pkgs.mpdris2 ];
}
