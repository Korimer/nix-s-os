{ inputs, ... }:
{
  imports = with inputs.flake-file.flakeModules; [
    dendritic
    nix-auto-follow
  ];

  flake-file = {
    outputs = ''
        inputs: import ./make-flake.nix inputs
      '';
    inputs = {
      den.url = "github:vic/den";
      import-tree.url = "github:vic/import-tree";
      impure-context = {
        type = "path";
        path = "./git-submodules/impure-context";
        flake = false;
      };
      self.submodules = true;
    };
    prune-lock.enable = true;
  };
}
