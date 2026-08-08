{ lib, ... }:

{
  programs.helix = lib.mkForce {
    enable = true;
    
  };

}
