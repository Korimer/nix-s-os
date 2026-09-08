{ den, inputs, ... }:
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
      environment.etc."mypulse".text = "HELP";
    };

    provides.korimer.homeManager = {
      home.file."mypulse".text = "HELP";
      services.wpaperd = {
        enable = true;
        settings.any.path = "${inputs.self}/resources/wednesday-1.png";
      };
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
