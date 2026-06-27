{ inputs, ... }:
{
  flake-file.inputs.agenix.url = "github:ryantm/agenix";

  den.aspects.agenix.nixos = {
    imports = [ inputs.agenix.nixosModules.default ];

  };

}
