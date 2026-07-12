# AGENTS.md

Reference for AI assistants working in this repo. Read this first to avoid
re-discovering things every session.

## What this is

A NixOS + Home Manager flake for the `bfg9k` host (user `zhori`). Targets
`x86_64-linux`, tracks `nixos-unstable`. Home Manager state version `25.11`.

## Repo layout

```
flake.nix                 # entrypoint; one host: bfg9k
hosts/bfg9k/              # machine config (hardware-configuration.nix lives here)
  default.nix             # host module pulling in ./modules/*
modules/                  # system-level NixOS modules
  core.nix desktop.nix development.nix fonts.nix
  locale.nix nix.nix printing.nix users.nix
home/zhori/               # Home Manager config for user zhori
  default.nix             # imports all *.nix below + package list
  shell.nix               # zsh
  tmux.nix                # tmux config + plugins + keybinds
  kitty.nix               # terminal (uses lib.mkForce)
  sway.nix                # swayfx + keybindings + kanshi + startup
  gtk.nix qt.nix          # theming
  noctalia.nix            # noctalia-shell integration
  service.nix             # user systemd services
  xdg-entries.nix
  git.nix pywalfox.nix env.nix
  noctalia/               # noctalia config (noctalia-config.toml)
```

Notable non-declarative / out-of-tree items (per README.md):
- Disk partitioning is manual.
- Theme, doomemacs config, and sway's non-HM config are not declarative.

## Flake inputs

- `nixpkgs` (nixos-unstable)
- `home-manager` (follows nixpkgs)
- `noctalia` (noctalia-shell)
- `neu-nix` (declared but currently unused in outputs)

## Build / apply

The host is `bfg9k`. To rebuild and switch:
```
sudo nixos-rebuild switch --flake .#bfg9k
```
Home Manager is wired via `home-manager.nixosModules`, so it applies as part
of the system rebuild — no separate `home-manager switch` needed.
`home-manager.useGlobalPkgs = true` and `useUserPackages = true`.

## Conventions

- Commit message prefix style: `[chore]`, `[fix]`, etc. (see `git log`)
- Indentation in Nix files mixes tabs and spaces inconsistently — match the
  surrounding file when editing.
- User does NOT want code comments added unless explicitly requested.
- Keep responses terse; the user values low token usage.

## tmux-session-dispensary

A hand-written bash session picker. **Lives outside this repo** at
`~/.local/bin/tmux-session-dispensary` (not managed by Nix). Sourced from
two places:

| Trigger              | Where                        | Behavior                                   |
|----------------------|------------------------------|--------------------------------------------|
| `Mod4+t` (sway)      | `home/zhori/sway.nix:109`    | `exec tmux-session-dispensary` (terminal)  |
| `prefix f` (tmux)    | `home/zhori/tmux.nix:52`     | `display-popup -E "tmux-session-dispensary"` |

### Dispatch model (important)

The script branches on whether it's run inside tmux (`$TMUX` set):

- **Inside tmux** (`prefix f` path): single-shot. `_pick` → `_launch` does
  `tmux switch-client -t <name>`. Popup closes immediately.
- **Outside tmux** (`Mod4+t` path): **loops**. `while _pick; do _launch; done`
  so that when an attached session dies (CTRL+D in the last window's shell,
  since `exit-empty=on` by default), `tmux attach` returns and the picker
  reappears. Pressing Esc at fzf makes `_pick` return non-zero → loop exits →
  terminal closes.

### Functions

- `_pick [path]` — fills global `selected`; returns 0 on pick, 1 on cancel.
  Accepts a CLI arg to bypass fzf (used on first loop iteration if launched
  with an argument; `set --` clears it afterwards).
- `_launch` — creates/switches/attaches based on `selected` and `$TMUX`.
  Special case: picking `$HOME` launches a detached session running `yazi`.

### Bookmarks

Hardcoded array near the top of the script (`bookmarks=(...)`). Edit there
directly — no external config file.

## tmux keybinds (prefix = Ctrl-space)

- `prefix f` — session dispenser popup
- `prefix |` / `prefix -` — split h/v in current path
- `prefix h/j/k/l` — pane navigation (vim-style fallback)
- `prefix n` / `prefix p` — next/prev session
- `prefix N` / `prefix P` — next/prev window

Plugins (managed by Home Manager, paths are store-prefixed in the generated
`~/.config/tmux/tmux.conf`): `vim-tmux-navigator`, `yank`, `resurrect`.

## sway keybinds (mod = Mod4)

- `Mod4+Return` — kitty
- `Mod4+t` — tmux-session-dispensary
- `Mod4+d` — noctalia launcher
- `Mod4+Shift+e` — emacsclient
- `Mod4+l` — noctalia lock
- `Mod4+r` — resize mode (vi-style arrows, Return/Escape to exit)

kanshi profiles live in `home/zhori/sway.nix`: `desk`, `undocked`,
`presentation`.
