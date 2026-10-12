inputs@{...}:
  let
    parts = inputs.flake-parts;
  in
  parts.lib.mkFlake { inherit inputs; } (
    {
      imports = [
        inputs.easy-hosts.flakeModule
      ];
      flake = {};
      systems = [];

      easy-hosts = {
        hosts = import ./hosts;
        perTag = tag: {
          
        };
      };
      perSystem = { ... }: {};
    })
