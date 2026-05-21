{ lib, ff, den, inputs, ... }:
let
  forwardInputs = { ... }: den.batteries.forward {
    each = lib.attrValues ff;
    fromClass = "in";
    intoClass = _: inputs.flake-file;
    intoPath = _: [ "inputs" ];
    fromAspect = _: ff;
  };
in
{
  den.default.includes = [
    forwardInputs
  ];

  ff.hi = {};
}
