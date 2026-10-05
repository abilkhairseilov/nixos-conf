{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    keyMode = "vi";
    mouse = true;
    historyLimit = 50000;
    baseIndex = 1;
    clock24 = true;
    extraConfig = ''
      # Leader: Ctrl-space
      unbind C-space
      set -g prefix C-space
      bind C-space send-prefix

      # True color
      set -ga terminal-overrides ",xterm-256color:Tc"

      # Renumber windows automatically when one is closed
      set -g renumber-windows on
      bind r move-window -r

      # Status bar
			set -g status-position top
			set -g status-interval 5
			set -g status-style 'fg=default bg=default'
			set -g message-style 'fg=default,bg=default'
			set -g message-command-style reverse

			# set -g status-left-length 20
			# set -g status-left "#S "

			set -g status-justify absolute-centre
			setw -g window-status-current-style 'fg=green bold bg=default'
			setw -g window-status-style 'fg=default'
			setw -g window-status-format "#I:#W"
			setw -g window-status-current-format "#I:#W"

# run-shell ~/git/tmux-battery/battery.tmux
# set -g status-right-length 100
# set -g status-right '#{battery_percentage} %a %h %d %H:%M '

			set -g pane-border-lines simple
			set -g pane-border-style fg=colour241
			set -g pane-active-border-style fg=colour39
      # Splits in current path
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Session navigation
      bind n switch-client -n
      bind p switch-client -p

      # Window navigation
      bind N next-window
      bind P previous-window

      # Session switcher
      bind f display-popup -E "tmux-session-dispensary"
    '';
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      # sensibility
      yank
      resurrect
    ];
  };
}
