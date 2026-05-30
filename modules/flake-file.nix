{ inputs, ... }:
{
  imports = with inputs.flake-file.flakeModules; [
    dendritic
    nix-auto-follow
  ];

  flake-file = {
    outputs = "inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules)";  
    inputs = {
      den.url = "github:vic/den";
      import-tree.url = "github:vic/import-tree";
      self.submodules = true;
    };
    prune-lock.enable = true;
  };
}
