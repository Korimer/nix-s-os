inputs@{...}:
let
  modules = import ./modules.nix inputs;
in
inputs.flake-parts.lib.mkFlake { inherit inputs; }
  {
    imports = [
      inputs.easy-hosts.flakeModule
    ];

    flake = {};
    systems = [];
    perSystem = { ... }: {};

    easy-hosts = {
      hosts = modules.hosts;
      perTag = tag: { modules = [ modules.tags.${tag} ]; }; 
      useGlobalPkgs = true;
      shared.specialArgs = { presets = modules.presets; };
    };
  }
