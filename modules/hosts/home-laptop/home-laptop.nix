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
    ];
    nixos =
    {
      systemd.sleep.settings.Sleep.HibernateMode = "platform";
      boot.kernelParams = [
        "pcie_aspm=off"
        "acpi.prefer_microsoft_dsm_guid=1"
      ];
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
