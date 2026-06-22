{
  den.aspects.korimer.provides.zsh = {
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
  };
}
