{ den, ... }:
{
  den.aspects.default.provides.wireguard = {
    includes = [ den.aspects.wireguard ];
  };
}
