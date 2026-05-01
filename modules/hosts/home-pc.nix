{ den, ... }:
{
  den.hosts.x86_64-linux.netzach.users = {
    korimer.classes = [];
  };

  den.aspects.netzach = {
    includes = [
      den.aspects.nvidia
      den.aspects.shellAliases.provides.nhUpdate
    ];
    nixos =
    #{ pkgs, ... }:
    {
    };
  };
}
