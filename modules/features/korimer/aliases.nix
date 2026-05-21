{ den, lib, ... }:
{
  den.aspects.korimer.provides.shellAliases = {

    includes = lib.attrValues den.aspects.korimer.provides.shellAliases.provides;

    provides = {
      nhUpdate = { host, ... }: {
        nixos = { config, pkgs, ... }: {
          environment.shellAliases.update =
            "${pkgs.nh}/bin/nh os switch /etc/nixos --impure";
        };
      };
      writeFlake = {
        nixos = { config, ... }: {
          environment.shellAliases.WriteFlake =
            "(cd /etc/nixos && nix run .#write-flake)";
        };
      };
    };
  };
}
