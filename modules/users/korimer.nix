{ korimer, inputs, den, lib, ... }:
{
  imports = [
    (inputs.den.namespace "korimer" true)
  ];
  den.aspects.korimer = {
    includes = [
      korimer.everywhere
    ];
  };

  den.aspects.korimer.provides.nothing = {
    nixos = {pkgs, ...}: { environment.systemPackages = [pkgs.etcd]; };
  };
}
