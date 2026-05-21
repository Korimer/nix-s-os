{ den, lib, ... }:
{
  den.aspects.korimer.provides.shellAliases = {

    includes = lib.attrValues den.aspects.korimer.provides.shellAliases.provides;

    provides.nhUpdate = { host, ... }: {
      nixos = { config, pkgs, ... }: { environment.shellAliases.update = "${pkgs.nh}/bin/nh os switch --file ${config.environment.variables.NIXROOT} nixosConfigurations.${host.name}"; };
    };
    provides.flakeGen = _: {
        nixos = { config, ... }: { environment.shellAliases.WriteFlake = "cd ${config.environment.variables.NIXROOT} && nix run .#write-flake"; };
      };
  };
}
