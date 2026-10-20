{ pkgs, ... }:

{
	programs.starship.enable = true;

	programs.fish = {
		enable = true;
		interactiveShellInit = ''
			set fish_greeting
			if test "$TERM" != "linux"
					alias ls 'eza --icons=auto -a'
			end
			if test "$TERM" = "xterm-kitty"
					alias ssh 'kitten ssh'
			end
		'';
		shellAliases = {
			ls = "ls --color -lah";
			vi = "nvim";
			cls = "clear";
      ff = "fastfetch";
		};
		plugins = [
			{
				name = "z";
				src = pkgs.fetchFromGitHub {
					owner = "jethrokuan";
					repo = "z";
					rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
					sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
				};
			}
		];
	};

	programs.eza = {
		enable = true;
		enableBashIntegration = true;
		enableZshIntegration = true;
		enableFishIntegration = true;
		git = true;
		icons = "auto";
	};

}

