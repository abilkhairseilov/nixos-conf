{ pkgs, ...}:
{
  home.packages = with pkgs;[
    
		prismlauncher
    apotris

		steam-tui
		protontricks
		gamescope

    uzdoom
    qzdl
    
  ];
  
}
