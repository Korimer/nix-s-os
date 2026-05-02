{ korimer, inputs, den, lib, ... }:
let
# see https://den.oeiuwq.com/guides/custom-classes/#example-alias-a-class-into-the-target-root
globalsClass = { class, aspect-chain }: den.provides.forward {
  each = [ "nixos" "darwin" ];
  fromClass = _: "os";
  intoClass = lib.id;
  intoPath = _: [ ]; # top-level
  fromAspect = _: lib.head aspect-chain;
};
in
{ den, ... }:
{
  imports = [
    (inputs.den.namespace "korimer" true)
  ];
  den.aspects.korimer = {
    includes = [ korimer.everywhere globalsClass ];
    nixos = { pkgs, ... }:
    {
    };
  };
}
