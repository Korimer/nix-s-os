{ inputs, ... }:
{
  den.aspects.korimer.provides.games = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.everest
        (pkgs.olympus.override {celesteWrapper = "steam-run";})
      ];
    };
  };
}

