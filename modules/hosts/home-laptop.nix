{ den, ... }:
{
  den.hosts.x86_64-linux.magic.users = {
    korimer = {};
  };

  den.aspects.magic = {
    includes = [
      den.aspects.bluetooth
      den.aspects.nvidia
    ]
    ;
    nixos =
    {
      systemd.sleep.settings.Sleep.HibernateMode = "platform";
    };
  };
}
