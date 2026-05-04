{ korimer, inputs, den, lib, ... }:
let
#everywhereClass = { class, aspect-chain }: den.provides.forward
#{
#  each = lib.singleton true;
#  fromClass = _: "everywher";
#  intoClass = _: class;
#  intoPath  = _: [];
#  fromAspect = _: {
#    includes = lib.attrValues ((lib.head aspect-chain));
#
#  };
#};
in
{
  imports = [
    (inputs.den.namespace "korimer" true)
  ];
  den.aspects.korimer = {
    includes = [ korimer.everywhere ];
  };
}
