{ den, lib, ... }:
{
  den.aspects.korimer.provides.shellAliases = {

    includes = lib.attrValues den.aspects.korimer.provides.shellAliases.provides;

    provides.nhUpdate = { host, ... }: {
      nixos = { pkgs, ... }: { environment.shellAliases.update = "${pkgs.nh}/bin/nh os switch --file /etc/nixos/ nixosConfigurations.${host.name}"; };
    };
  };
}
