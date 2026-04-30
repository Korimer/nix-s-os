{ den, ... }:
{
  den.hosts.x86_64-linux.magic.users = {
    korimer.classes = [];
  };

  den.aspects.magic = {
    includes = [
      den.aspects.nvidia
      den.aspects.shellAliases.provides.nhUpdate
    ];
    nixos =
    { pkgs, ... }:
    {
      systemd.sleep.settings.Sleep.HibernateMode = "shutdown";
      environment.systemPackages = [
        pkgs.vim
      ];
    };
  };
}
