let 
  toBinFmt = formats: builtins.listToAttrs (
    map (format: {
      name = format;
      value = { nixos.boot.binfmt.emulatedSystems = [ format ];};
    })
      formats
  );
in
{
  den.aspects.binfmt.provides = toBinFmt [
    "aarch64-linux"
  ];
}
