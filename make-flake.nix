inputs@{...}:
let
  parts = inputs.flake-parts;
  resolveTag = tag:
  {
    modules = [
      ( inputs.import-tree ./tags/${tag} )
    ];
  };
in
parts.lib.mkFlake { inherit inputs; }
  {
    imports = [
      inputs.easy-hosts.flakeModule
    ];

    flake = {};
    systems = [];
    perSystem = { ... }: {};

    easy-hosts = {
      hosts = import ./hosts;
      perTag = resolveTag; 
      useGlobalPkgs = true;
    };
  }
