inputs@{...}:
  let
    parts = inputs.flake-parts;
  in
  parts.lib.mkFlake { inherit inputs; } (
    {
      imports = [];
      flake = {};
      systems = [];
      perSystem = { ... }: {};
    })
