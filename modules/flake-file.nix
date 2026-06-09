{ inputs, ... }:
let
  writeFlakeRoot = pkgs: pkgs.writeShellScriptBin "write-flake-root"
  ''
    echo "$PWD" > "$PWD/flake-root.nix"
  '';
in
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
      self.submodules = true;
    };
    write-hooks = [
      {
        index = 101;
        program = writeFlakeRoot;
      }
    ];
    prune-lock.enable = true;
  };
}
