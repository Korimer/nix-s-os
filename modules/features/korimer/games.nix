{ inputs, ... }:
{


  #flake-file.inputs.helium = {
  #  url = "github:vikingnope/helium-browser-nix-flake";
  #};

  den.aspects.korimer.provides.games = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.everest
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

