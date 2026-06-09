inputs:
inputs.flake-parts.lib.mkFlake {
  inherit inputs;
  specialArgs = let 
    root = import ./flake-root.nix;
  in
  {
    flake-root = {
      literal = builtins.unsafeDiscardStringContext root;
      path = root;
    };
  };
} (inputs.import-tree ./modules)
