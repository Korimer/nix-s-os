{ den, lib, ... }:
{
  den.aspects.korimer.provides.games = {

    includes = lib.attrValues den.aspects.korimer.provides.games.provides;

    provides = {
      celeste.nixos = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [
          everest
            (olympus.override {celesteWrapper = "steam-run";})
        ];
      };

      sober = {
        includes = [ den.aspects.flatpak ];
        nixos = _: {
          services.flatpak.packages = [
            "org.vinegarhq.Sober"
          ];
        };
      };
    };
  };
}
