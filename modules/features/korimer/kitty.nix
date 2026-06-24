{ den, ... }:
{
  den.aspects.korimer.provides.kitty = {

    provides.shellIntegration = {
      includes = with den.aspects.korimer.provides.kitty.shellIntegration.provides;
      [
        zshIntegration
        bashIntegration
        fishIntegration
      ];

      provides = {
        bashIntegration.nixos = { lib, ... }:
          { programs.bash.interactiveShellInit = lib.mkAfter ""; };
        zshIntegration.nixos = { lib, ... }:
          { programs.zsh .interactiveShellInit = lib.mkAfter ""; };
        fishIntegration.nixos = { lib, ... }:
          { programs.fish.interactiveShellInit = lib.mkAfter ""; };
      };
    };

    nixos = { pkgs, ... }: {
      environment.systemPackages = [ pkgs.kitty ];
    };
  };
}
