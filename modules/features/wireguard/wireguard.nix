{ den, ... }:
{
  # also see https://discourse.nixos.org/t/wireguard-dns-over-systemd-resolved/47306/13
  den.aspects.wireguard = {
    nixos = { networking.wireguard.enable = true; };

    includes = [ den.aspects.wireguard.provides.utils ];

    provides.utils.includes = [
      den.aspects.netns
      den.aspects.firejail
    ];
  };
}
