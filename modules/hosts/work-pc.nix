{ den, ... }:
{
  den.hosts.x86_64-linux.fortnite.users = {
    korimer.classes = [];
  };

  den.aspects.fortnite = {
    includes = [
      #den.aspects.nvidia
      den.aspects.shellAliases.provides.nhUpdate
    ];
    nixos =
    #{ pkgs, ... }:
    {
    };
  };
}
