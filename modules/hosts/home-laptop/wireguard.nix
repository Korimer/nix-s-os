{ den, ... }:
{
  den.aspects.magic.includes = [
    den.aspects.wireguard.provides.csu-vpn
    den.aspects.magic.provides.proton-vpn
  ];

  den.aspects.magic.provides.proton-vpn.nixos = { config, ... }: {
  };
}

