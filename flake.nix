#{
## Declares flake inputs
#  inputs = {
#    flake-parts = {
#      url = "github:hercules-ci/flake-parts";
#      inputs.nixpkgs-lib.follows = "nixpkgs";
#    };
#
#    den.url = "github:denful/den";
#
#    import-tree.url = "github:vic/import-tree";
#
#    nixpkgs.url = "github:nixos/nixpkgs/25.11";
#  };
#
#  outputs =
#    inputs:
#    inputs.flake-parts.lib.mkFlake { inherit inputs; }
#      (inputs.import-tree ./modules);
#}


#let
#sources = import ./npins; # (1)
#with-inputs = import sources.with-inputs sources { }; # (2)
#outputs = inputs:
#(inputs.nixpkgs.lib.evalModules { # (3)
# modules = [ (inputs.import-tree ./modules) ]; # (4)
# specialArgs.inputs = inputs; # (5)
# }).config.flake; # (6)
#  in
#with-inputs outputs # (7)


{
  outputs = inputs:
    (inputs.nixpkgs.lib.evalModules {
      modules = [ (inputs.import-tree ./modules) ];
      specialArgs = { inherit inputs; };
    }).config.flake;

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    import-tree.url = "github:vic/import-tree";
    den.url = "github:vic/den";
  };
}
