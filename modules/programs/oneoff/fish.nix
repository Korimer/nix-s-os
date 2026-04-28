{ ... }:
{
  den.aspects.fish = {
    includes = [
      ({ host, ... }: {
       nixos = { pkgs, ... }: {
       programs.fish.shellAliases.update = "${pkgs.nh}/bin/nh os switch --file /etc/nixos/ nixosConfigurations.${host.name}";
       };
       })
    ];
    nixos = { pkgs, ... }:
    {
      programs.fish.enable = true;
      users.defaultUserShell = pkgs.fish;
    };
  };
}
