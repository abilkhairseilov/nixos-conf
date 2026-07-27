{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    keyMode = "vi";
    mouse = true;
    historyLimit = 50000;
    baseIndex = 1;
    clock24 = false;
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
      set -g status-position bottom
      set -g status-style "bg=#1a1b26,fg=#a9b1d6"
      set -g status-left "#[fg=#7aa2f7,bold] #S "
      set -g status-right "#[fg=#565f89] %H:%M "
      set -g window-status-format " #I:#W "
      set -g window-status-current-format "#[fg=#1a1b26,bg=#7aa2f7,bold] #I:#W "
      set -g pane-active-border-style "fg=#7aa2f7"
      set -g pane-border-style "fg=#3b4261"

      # Splits in current path
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %

      # Vim-style pane switching (fallback when tmux-navigator isn't active)
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
