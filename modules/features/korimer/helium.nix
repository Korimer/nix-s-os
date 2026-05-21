{ inputs, ... }:
{
  den.aspects.korimer.provides.helium = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        inputs.helium.packages.${pkgs.system}.default
      ];
      #nixpkgs.overlays = [
      #  inputs.helium.overlays.default
      #];
      #environment.systemPackages = [
      #  pkgs.etcd
      #  pkgs.helium
      #];
    };
  };
}
