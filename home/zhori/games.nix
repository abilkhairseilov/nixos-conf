{ pkgs, ...}:
{
  home.packages = with pkgs;[
    
		prismlauncher
    apotris

    balatro

		steam-tui
		gamescope

    uzdoom
    qzdl
    
  ];
  
}
