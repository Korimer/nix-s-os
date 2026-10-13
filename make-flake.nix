inputs@{...}:
let
  modules = import ./modules.nix inputs;
  systems = import inputs.systems;
in
inputs.flake-parts.lib.mkFlake { inherit inputs; }
  {

    flake-file = {
      auto-follow.enable = true;
      outputs = ''
        inputs: import ./make-flake.nix inputs
      '';
    };


    imports = [
      inputs.easy-hosts.flakeModule
      inputs.flake-file.flakeModules.default
      #inputs.flake-root.flakeModule.flakeModule
      ./inputs.nix
    ];

    flake = {};
    systems = systems;
    #perSystem = { pkgs, config, ... }: {
    #  flake-root.projectRootFile = "flake.nix";
    #  devShells.default = pkgs.mkShell {
    #    inputsFrom = [ config.flake-root.devShell ];
    #  };
    #};


    easy-hosts = {
      hosts = modules.hosts;
      perTag = tag: { modules = [ modules.tags.${tag} ]; }; 
      useGlobalPkgs = true;
      shared.specialArgs = { presets = modules.presets; };
    };
  }
