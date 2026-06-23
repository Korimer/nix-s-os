{ den, ... }:
{
  den.hosts.x86_64-linux.fortnite.users = {
    ets-c837275181 = {
      name = "ets-c8372751818";
      userName = "ets-c837275181";
      aspect = den.aspects.korimer;
    };
  };

  den.aspects.fortnite = {
    includes = [
    ];
    provides.nirimonitors = {
      includes = [ den.aspects.niriconfig ];

      nixos = {
        niriconfig.monitors = ''
          
        '';
      };
    };
  };
}
