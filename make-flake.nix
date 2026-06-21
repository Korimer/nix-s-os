inputs:
let
  tryImport = attr:
    let toImport = inputs.impure-context + "/${attr.name}.nix"; in
      if builtins.pathExists toImport
        then import toImport
        else attr.default
;
in
inputs.flake-parts.lib.mkFlake {
  inherit inputs;
  specialArgs = let 
    flake-root = tryImport {name="flake-root"; default="/etc/nixos";};
    currentSystem = tryImport {name="current-system"; default="x86_64-linux";};
  in
  {
    flake-root = flake-root;
    currentSystem = currentSystem;
  };
} (inputs.import-tree ./modules)
