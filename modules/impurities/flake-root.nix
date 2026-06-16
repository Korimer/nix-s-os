let
  writeFlakeRoot = pkgs: pkgs.writeShellScriptBin "write-flake-root"
  ''
    echo "$PWD" > "$PWD/flake-root.nix"
  '';
in
{
  flake-file.write-hooks = [
    {
      index = 101;
      program = writeFlakeRoot;
    }
  ];
}

