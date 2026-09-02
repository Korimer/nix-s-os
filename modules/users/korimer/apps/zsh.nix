{ den, ... }:
{
  den.aspects.korimer.provides.zsh = {
    includes = [ den.aspects.korimer.provides.zsh.provides.defaultShell ];

    nixos = {
      programs.zsh.enable = true;
      environment.pathsToLink = [ "/share/zsh" ];
    };

    homeManager = { pkgs, ... }: {
      programs.starship = {
        enable = true;
        enableZshIntegration = true;
        presets = [
          "gruvbox-rainbow"
        ];
      };

      programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        initContent = ''
          source <(fzf --zsh)
          eval "$(pay-respects zsh)"
        '';
      };

      home.packages = with pkgs; [ fzf pay-respects ];
    };

    provides.defaultShell = { user }:
      { nixos = if user.isRemoteUser then {} else
        { pkgs, ...}: {
          # Is this correct? Unsure whether to use name or username
          users.users.${user.name}.shell = pkgs.zsh;
        };
      };
  };
}
