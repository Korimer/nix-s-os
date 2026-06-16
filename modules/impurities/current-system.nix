{ currentSystem, ... }:
let
  hostSystem = if (builtins ? currentSystem) then builtins.currentSystem else currentSystem;
  writeHostSystem = pkgs: pkgs.writeShellScriptBin "write-host-system"
  ''
    echo "\"${hostSystem}\"" > "$PWD/git-submodules/impure-context/current-system.nix"
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
