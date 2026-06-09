{ inputs, ... }:
{
  flake-file.inputs.helium.url = "github:vikingnope/helium-browser-nix-flake";

  den.aspects.korimer.provides.helium = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
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
