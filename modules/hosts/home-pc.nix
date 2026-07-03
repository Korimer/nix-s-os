{ den, ... }:
{
  den.hosts.x86_64-linux.netzach.users = {
    korimer = {};
  };

  den.aspects.netzach = {
    includes = [
      den.aspects.nvidia
      den.aspects.binfmt.provides.aarch64-linux
      den.aspects.wireguard.provides.networks.provides.csu-vpn
    ];

    provides.nirimonitors = {
      includes = [ den.aspects.niriconfig ];

      nixos = {
        niriconfig.monitors.text = ''
          
        '';
      };
    };
  };
}
