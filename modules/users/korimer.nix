{ korimer, inputs, ... }:
{
  imports = [
    (inputs.den.namespace "korimer" true)
  ];
  den.aspects.korimer = {
    includes = [ korimer.everywhere ];
  };
}
