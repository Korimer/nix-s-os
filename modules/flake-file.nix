{ lib, ff, inputs, ... }:
{
  imports = [
    inputs.flake-file.flakeModules.dendritic
      inputs.flake-file.flakeModules.npins
      (inputs.den.namespace "ff" true)
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
      helium.url = "github:vikingnope/helium-browser-nix-flake";

      fenix = {
        url = "github:nix-community/fenix";
        flake = false;
      };


      with-inputs = {
        url = "github:vic/with-inputs";
        flake = false;
      };
    };
  };
}
