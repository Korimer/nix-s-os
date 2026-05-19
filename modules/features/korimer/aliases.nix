{ den, lib, ... }:
{
  den.aspects.korimer.shellAliases.provides = {

    includes = lib.attrValues den.aspects.korimer.shellAliases.provides;

    nhUpdate = { host, ... }: {
      nixos = { pkgs, ... }: { environment.shellAliases.update = "${pkgs.nh}/bin/nh os switch --file /etc/nixos/ nixosConfigurations.${host.name}"; };
    };
  };
}
