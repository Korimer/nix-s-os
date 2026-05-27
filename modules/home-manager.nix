{ inputs, ... }:
{
  flake-file.inputs.home-manager.url = "github:nix-community/home-manager";
  den.aspects.home-manager = {
    nixos = { ... }:
    {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      inputs.home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
      };
    };
  };
}
