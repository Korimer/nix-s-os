{ korimer, inputs, den, lib, ... }:
let
# see https://den.oeiuwq.com/guides/custom-classes/#example-alias-a-class-into-the-target-root
globalsClass = { class, aspect-chain }:
den.provides.forward {
  each = lib.singleton class;
  fromClass = _: "global";
  intoClass = _: "provides";
  intoPath = _: [ ];
  fromAspect = _: lib.head aspect-chain;
  adaptArgs = { config, ... }: { public = config; };
};

personalsClass = { class, aspect-chain }:
den.provides.forward {
  each = lib.singleton class;
  fromClass = _: "personal";
  intoClass = _: "provides";
  intoPath = _: [ ];
  fromAspect = _: lib.head aspect-chain;
  adaptArgs = { config, ... }: {
    private = lib.mkMerge (lib.attrValues config);
  };
};

in
{
  imports = [
    (inputs.den.namespace "korimer" true)
  ];
  den.aspects.korimer = {
    includes = [
      korimer.everywhere
      globalsClass
      personalsClass
    ];
  };
}
