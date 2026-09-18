{ den, ... }:
{
  den.hosts.x86_64-linux.netzach.users = {
    korimer = {};
  };

  den.aspects.netzach = {
    includes = [
      den.aspects.nvidia
      den.aspects.binfmt.provides.aarch64-linux
      den.aspects.netzach.provides.nirimonitors
    ];

    environment.etc."mango/specializations.conf".text = ''
      monitorrule=model:209MXUNBQ390,transform:1,x:0,y:0
      monitorrule=model:UWZ190700593,transform:0,x:1080,y:280
    '';

    provides.nirimonitors = {
      includes = [ den.aspects.niriconfig ];

      nixos = {
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
