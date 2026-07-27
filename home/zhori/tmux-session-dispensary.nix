{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellApplication {
      name = "tmux-session-dispensary";
      bashOptions = [];
      runtimeInputs = with pkgs; [ fzf tmux yazi gawk findutils gnused ];
      text = ''
        BLUE='\033[1;34m'
        YELLOW='\033[1;33m'
        NC='\033[0m'

        # 1. Define your hardcoded bookmarks here (No external config files needed!)
        bookmarks=(
          "$HOME/.config/nvim"
          "$HOME/nixos"
          "$HOME/notes/md"
          "$HOME/notes/typst"
          "$HOME"
        )

        # --- functions --------------------------------------------------------------- #

        # Fills the global `selected` variable. Returns 0 on a successful pick,
        # 1 on cancellation (Esc / empty input). If a path is passed as $1 it is
        # used directly, bypassing fzf (CLI shortcut).
        _pick() {
            if [[ $# -eq 1 ]]; then
                selected=$1
                return 0
            fi

            declare -A seen
            items=""

            # 2a. Active sessions (blue bold)
            while IFS= read -r sess; do
                items+="''${BLUE}→ ''${sess}''${NC}"$'\n'
                seen["$sess"]=1
            done < <(tmux list-sessions -F '#{session_name}' 2>/dev/null)

            # 2b. Bookmarks (yellow)
            for bmp in "''${bookmarks[@]}"; do
                if [[ -d "$bmp" ]] && [[ -z "''${seen[$bmp]}" ]]; then
                    items+="''${YELLOW}★ ''${bmp}''${NC}"$'\n'
                    seen["$bmp"]=1
                fi
            done

            # 2c. Home directories at depth 1 (no color, no dotfiles)
            while IFS= read -r dir; do
                if [[ -z "''${seen[$dir]}" ]]; then
                    items+="''${dir}"$'\n'
                fi
            done < <(find ~ -maxdepth 1 -mindepth 1 -type d ! -name '.*' 2>/dev/null | sort)

            # 3. Pipe to fzf, strip ANSI codes, extract path
            selected=$(echo -e "$items" | fzf --ansi | sed $'s/\x1b\\[[0-9;]*m//g' | awk '{print $NF}')

            [[ -n "$selected" ]]
        }

        # Creates / switches to / attaches to a session for the value in `selected`.
        # Blocks inside `tmux attach` until the session ends (e.g. via CTRL+D in the
        # last window's shell). Returns 0 when the session terminates normally.
        _launch() {
            if [[ -z "$selected" ]]; then
                return 1
            fi

            # 4. Clean up the session name
            if [[ -d "$selected" ]]; then
                selected_name=$(basename "$selected" | tr . _)
            else
                selected_name="$selected"
            fi

            tmux_running=$(pgrep tmux)

            # 5. Handle creation or switching
            if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
                tmux new-session -s "$selected_name" -c "$selected"
                return 0
            fi

            if ! tmux has-session -t "$selected_name" 2>/dev/null; then
                if [[ "$selected" == "$HOME" ]]; then
                    tmux new-session -ds "$selected_name" -c "$selected" "yazi"
                else
                    tmux new-session -ds "$selected_name" -c "$selected"
                fi
            fi

            if [[ -n $TMUX ]]; then
                tmux switch-client -t "$selected_name"
            else
                tmux attach-session -t "$selected_name"
            fi
        }

        # --- dispatch ---------------------------------------------------------------- #

        if [[ -n "$TMUX" ]]; then
            # Invoked from `prefix f` (display-popup): single-shot switch-client,
            # popup closes immediately. No looping here.
            _pick "$@" && _launch
        else
            # Invoked from `mod+t` or a bare terminal: loop so that when the attached
            # session dies (CTRL+D in the last window's shell), the picker reappears.
            # Esc at the fzf prompt → _pick returns non-zero → loop exits → terminal
            # closes.
            while _pick "$@"; do
                _launch
                # After the first iteration, drop the CLI arg so subsequent loops go
                # through fzf instead of reusing the same path.
                set --
            done
        fi
      '';
    })
  ];
}
