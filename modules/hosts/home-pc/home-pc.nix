{ den, ... }:
{
  den.hosts.x86_64-linux.netzach.users = {
    korimer = {};
  };

  den.aspects.netzach = {
    includes = [
      den.aspects.nvidia
      den.aspects.binfmt.provides.aarch64-linux
      den.aspects.netzach.provides.monitors
    ];


    provides.monitors = {
      includes = [ den.aspects.niriconfig ];

      nixos = {
        environment.etc."mango/specializations.conf".text = ''
          monitorrule=serial:UWZ190700593,x:0,y:0,rr:1
          monitorrule=serial:209MXUNBQ390,x:1080,y:356,rr:0
        '';

        niriconfig.monitors.text = ''
          output "DP-3" {
            position x=1080 y=356
          }
          output "HDMI-A-1" {
            position x=0 y=0
              transform "90"
          }
        '';
      };
    };
  };
}
