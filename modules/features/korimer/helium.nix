{ korimer, inputs, ... }:
{


  #flake-file.inputs.helium = {
  #  url = "github:vikingnope/helium-browser-nix-flake";
  #};

  korimer.everywhere.includes = [ korimer.helium ];
  korimer.helium = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        inputs.helium-browser-nix-flake.packages.${pkgs.system}.default
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
