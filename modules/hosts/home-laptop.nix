{ den, ... }:
{
  den.hosts.x86_64-linux.magic.users = {
    korimer = {};
  };

  den.aspects.magic = {
    includes = [
      den.aspects.nvidia
    ];
    nixos = { pkgs, ... }:
    {
      systemd.sleep.settings.Sleep.HibernateMode = "shutdown";
      environment.systemPackages = [
        pkgs.vim
      ];
    };
  };
}
