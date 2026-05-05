{ ... }:
{
  den.aspects.korimer.provides.nh = { nixos = { pkgs, ...}: { environment.systemPackages = [ pkgs.nh ]; }; };
}
