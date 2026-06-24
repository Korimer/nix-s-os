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
        environment.shellInit = lib.mkAfter ''
          
        '';
      };
    };
  };
}
