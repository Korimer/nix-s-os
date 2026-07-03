{ den, ... }:
{
  den.hosts.x86_64-linux.magic.users = {
    korimer = {};
  };

  den.aspects.magic = {
    includes = [
      den.aspects.bluetooth
      den.aspects.nvidia
      den.aspects.magic.provides.nirimonitors
      den.aspects.wireguard.provides.networks.provides.csu-vpn
    ];
    nixos =
    {
      systemd.sleep.settings.Sleep.HibernateMode = "platform";
    };

    provides.nirimonitors = {
      includes = [ den.aspects.niriconfig ];

      nixos = {
        niriconfig.monitors.text = ''
          
        '';
      };
    };
  };
}
