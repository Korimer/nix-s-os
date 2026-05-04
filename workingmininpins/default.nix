let
  sources = import ./npins;
  with-inputs = import sources.with-inputs sources {

  };

  outputs =
    inputs@{ flake-parts, import-tree, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (import-tree ./modules);

  #outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (import ./modules);

  #outputs =
  #  inputs:
  #  (inputs.nixpkgs.lib.evalModules {
  #    modules = [ (inputs.import-tree ./modules) ];
  #    specialArgs = {
  #      inherit inputs;
  #      self = inputs.self;
  #    };
  #  }).config;
in
with-inputs outputs
