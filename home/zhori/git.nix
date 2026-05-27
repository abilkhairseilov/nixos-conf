{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName  = "Abilkhair Seilov";
    userEmail = "abilkhairseilov@outlook.com";

    signing = {
      # gpgPath = "gpg2";
      # key = "YOUR_GPG_KEY_ID";
      # signByDefault = true;
    };

    extraConfig = {
      init.defaultBranch = "main";

      core = {
        editor     = "emacsclient -c";
        autocrlf   = "input";            # LF on commit, no conversion on checkout
        whitespace = "trailing-space,space-before-tab";
      };

      pull.rebase  = true;               # rebase instead of merge on pull
      push.autoSetupRemote = true;       # auto-track remote branch on first push
      fetch.prune  = true;               # delete stale remote-tracking branches

      rebase = {
        autoStash   = true;              # stash dirty tree before rebase
        autoSquash  = true;              # respect fixup!/squash! commits
      };

      merge.conflictStyle = "zdiff3";    # shows base + both sides in conflicts

      diff = {
        algorithm   = "histogram";       # better diff output than myers
        colorMoved  = "default";         # highlight moved blocks differently
      };

      status.showUntrackedFiles = "all"; # show files inside untracked dirs

      help.autocorrect = 10;             # auto-fix mistyped commands (1s delay)

      rerere = {
        enabled    = true;               # remember conflict resolutions
        autoUpdate = true;
      };

      url."git@github.com:".insteadOf = "https://github.com/";
    };

    delta = {
      enable  = true;
      options = {
        navigate    = true;
        side-by-side = true;
        line-numbers = true;
        syntax-theme = "Nord";
      };
    };

    aliases = {
      lg   = "log --oneline --graph --decorate --all";
      undo = "reset HEAD~1 --mixed";
      wip  = "commit -am 'wip'";
      unwip = "reset HEAD~1 --mixed";
    };

    ignores = [
      ".DS_Store"
      "*.swp"
      ".direnv"
      ".envrc"
    ];
  };
}
