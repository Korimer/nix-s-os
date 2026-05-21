{ lib, ff, inputs, ... }:
{
  imports = [
    inputs.flake-file.flakeModules.dendritic
      inputs.flake-file.flakeModules.npins
      (inputs.den.namespace "ff" true)
  ];

  flake-file = {
    outputs = "inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules)";  
    inputs = {
      den.url = "github:vic/den";
      flake-file.url = "github:vic/flake-file";
      import-tree.url = "github:vic/import-tree";
    };
  };
}
