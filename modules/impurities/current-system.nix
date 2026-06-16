{ currentSystem, ... }:
let
  hostSystem = if (builtins ? currentSystem) then builtins.currentSystem else currentSystem;
  writeHostSystem = pkgs: pkgs.writeShellScriptBin "write-host-system"
  ''
    echo "${hostSystem}" > "$PWD/flake-root.nix"
  '';
in
{
  flake-file.write-hooks = [
    {
      index = 102;
      program = writeHostSystem;
    }
  ];
}
