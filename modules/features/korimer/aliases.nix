{ korimer, ... }:
{
  korimer.everywhere.includes = [ korimer.shellAliases ];
  korimer.shellAliases.provides = {

    includes = with korimer.shellAliases.provides; [
      nhUpdate
    ];

    nhUpdate = { host, ... }: {
      nixos = { pkgs, ... }: { environment.shellAliases.update = "${pkgs.nh}/bin/nh os switch --file /etc/nixos/ nixosConfigurations.${host.name}"; };
    };
  };
}
