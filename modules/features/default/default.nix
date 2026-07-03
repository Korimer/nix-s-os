{ den, ... }:
{
  den.default.includes = builtins.attrValues den.aspects.default.provides;
}
