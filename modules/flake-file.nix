{ inputs, ... }:
{
  imports = with inputs.flake-file.flakeModules; [
    dendritic
    npins
  ];

  flake-file = {
#outputs = "inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules)";  
    inputs = {
      den.url = "github:vic/den";
      flake-file.url = "github:vic/flake-file";
      flake-parts.url = "github:hercules-ci/flake-parts";
      flake-aspects.url = "github:vic/flake-aspects";
      import-tree.url = "github:vic/import-tree";
      systems.url = "github:nix-systems/nix-systems";

      with-inputs = {
        url = "github:vic/with-inputs";
        flake = false;
      };
    };
  };
}
