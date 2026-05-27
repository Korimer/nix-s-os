{ lib, den, inputs, ... }:
{
  flake-file.inputs.home-manager.url = "github:nix-community/home-manager";

  den.schema.user = {
    includes = [ den.aspects.home-manager ];
    classes = lib.mkDefault [ "homeManager" ];
  };

  den.aspects.home-manager = {
    nixos = { ... }:
    {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
      };
    };
  };
}
