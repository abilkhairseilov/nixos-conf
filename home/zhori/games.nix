{ pkgs, ...}:
{
  home.packages = with pkgs;[
    
		prismlauncher
    apotris

    rkpd2
    balatro

		steam-tui
		gamescope

    uzdoom
    qzdl
    
  ];
  
}
