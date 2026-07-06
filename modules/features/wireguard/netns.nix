{ den, inputs, ... }:
{
  flake-file.inputs.nnwg.url = "github:Korimer/NNWG";
  den.aspects.netns = {
    nixos = {
      imports = [ inputs.nnwg.nixosModules.default ];
    };
  };
}
