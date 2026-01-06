{ pkgs, ... }:

{
	programs.zsh = {
		enable = true;
		enableCompletion = true;

		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		history = {
			size = 5000;
			save = 5000;
			path = "$HOME/.zsh_history";
			ignoreDups = true;
			ignoreSpace = true;
			share = true;
		};

		shellAliases = {
			ls = "ls --color -lah";
			vi = "nvim";
			cls = "clear";
		};

		initContent = ''
		  # powerlevel10k
			source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
			[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

			# Keybindings
			bindkey -e
			bindkey '^q' history-search-backward
			bindkey '^n' history-search-forward
			bindkey '^[w' kill-region

			# Completion styling
			zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
			zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
			zstyle ':completion:*' menu no
			zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
			zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

			# Environment
			export PATH="$PATH:$HOME/.local/bin:$HOME/conf/scripts"
			export EDITOR="vim"

			# fzf & zoxide
			eval "$(${pkgs.fzf}/bin/fzf --zsh)"
			eval "$(${pkgs.zoxide}/bin/zoxide init --cmd cd zsh)"
		'';

		plugins = [
			{
				name = "fzf-tab";
				src = pkgs.fetchFromGitHub {
					owner = "Aloxaf";
					repo = "fzf-tab";
					rev = "master";
					sha256 = "sha256-1Ior+/9e+M+Fc1u0uq5HhknlGRS96q7tazhEE6rmx9Y=";
				};
			}
		];
	};

	programs.starship.enable = false;

}

