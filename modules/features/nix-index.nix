{ inputs, ... }:
{
  flake-file.inputs.nix-index-database.url = "github:nix-community/nix-index-database";

  den.aspects.nix-index = {
    nixos = { ... }: {
      imports = [
        inputs.nix-index-database.nixosModules.default
      ];
    };
  };

}

