{
  den.aspects.korimer.provides.tmux = {
    nixos = {
      programs.tmux = {
        enable = true;
      };
    };

    homeManager = { lib, ... }: {
      programs.tmux.extraConfig =
        lib.mkAfter "source-file ~/.config/tmux/tmux.conf";
    };

    provides.shellInit = {
      nixos = { lib, ... }: {
        programs.bash.interactiveShellInit = lib.mkAfter ''
          if [ -z "$TMUX" ] && [ -n "$PS1" ]; then
            exec tmux attach || exec tmux new-session
          fi
        '';

        programs.zsh.initExtra = lib.mkAfter ''
          if [ -z "$TMUX" ] && [ -n "$PS1" ]; then
            exec tmux attach || exec tmux new-session
          fi
        '';

        programs.fish.interactiveShellInit = lib.mkAfter ''
          if test -z "$TMUX"; and test -n "$PS1"
            exec tmux attach; or tmux new-session
          end
        '';
      };
    };
  };
}
