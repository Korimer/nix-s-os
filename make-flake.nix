inputs@{...}:
let
  modules = import ./modules.nix inputs;
  systems = import inputs.systems;
in
inputs.flake-parts.lib.mkFlake { inherit inputs; }
  {
    flake = {
      # output inputs for easier debugging
      inputs = inputs;
    };
    systems = systems;
    debug = true;

    imports = [
      inputs.easy-hosts.flakeModule
      inputs.flake-file.flakeModules.default
      #inputs.flake-root.flakeModule.flakeModule
      ./inputs.nix
    ];

    easy-hosts = {
      hosts = modules.hosts;
      perTag = modules.perTag; 
      useGlobalPkgs = false;
      shared.modules = [
        ({config,...}:
         { _module.args.stablePkgs = inputs.stablepkgs.legacyPackages.${config.nixpkgs.hostPlatform.system}; })
      ];
      shared.specialArgs = { presets = modules.presets; };
    };

    flake-file = {
      auto-follow.enable = true;
      outputs = ''
        inputs: import ./make-flake.nix inputs
      '';
    };
  }
