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
          monitorrule=model:209MXUNBQ390,transform:1,height:1920,width:1080,x:0,y:0
          monitorrule=model:UWZ190700593,transform:0,height:1440,width:2560,x:1080,y:280
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
