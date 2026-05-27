{ den, ... }:
{
  den.hosts.x86_64-linux.netzach.users = {
    ets-c837275181 = {
      userName = "ets-c837275181";
      aspect = den.aspects.korimer;
    };
  };

  den.aspects.netzach = {
    includes = [
      den.aspects.nvidia
    ];
  };
}
