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
    root = tryImport {name="flake-root"; default="/etc/FAIL";};
    currentSystem = tryImport {name="current-system"; default="x86_64-linux";};
  in
  {
    flake-root = {
      literal = builtins.unsafeDiscardStringContext root;
      path = inputs.self;
    };
    currentSystem = currentSystem;
  };
} (inputs.import-tree ./modules)
