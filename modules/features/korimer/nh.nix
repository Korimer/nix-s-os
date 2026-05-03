{ korimer, ... }:
{
  korimer.everywhere.includes = [ korimer.nh ];
  korimer.nh = { nixos = { pkgs, ...}: { environment.systemPackages = [ pkgs.nh ]; }; };
}
