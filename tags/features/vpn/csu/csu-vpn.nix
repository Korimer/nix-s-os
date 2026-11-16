{ config, presets, ... }:
let
  endpointMachine = "129.82.233.44";
  interfaceName = "alt-csu-vpn";
  firewallMark = 6909; # Phone number of csu admissions (true)
in
{
  imports = [ presets.vpn ];
  my.secretGroups = [ "csu-vpn" ];

  age.secrets.wg-csu-preshared-key.owner = "systemd-network";
  age.secrets.wg-csu-private-key.owner = "systemd-network";

  systemd.network.enable = true;
  services.resolved.enable = true;

  systemd.network.netdevs.${interfaceName} = {
    enable = true;
    netdevConfig = {
      Name = interfaceName;
      Kind = "wireguard";
      Description = "W ryan";
    };


    wireguardConfig = {
      PrivateKeyFile = config.age.secrets.wg-csu-private-key.path;
      FirewallMark = firewallMark; # arbitrary number not used elsewhere in my conf
      RouteTable = firewallMark; #could be anything, doubly arbitrary
    };

    wireguardPeers = [{
      PersistentKeepalive = 30;
      AllowedIPs = [
        "129.82.0.0/16"
        "10.1.0.0/16"
        "10.2.0.0/16"
      ];
      Endpoint = "${endpointMachine}:52813";
      PublicKey = "cdFaHjSCz3oe81Gyl/86W1th4Hj4LK3iORDCLZmF0gI=";
      PresharedKeyFile = config.age.secrets.wg-csu-preshared-key.path;
    }];
  };

  systemd.network.networks.${interfaceName} = {
    matchConfig.Name = interfaceName; # Apply this rule to the following interface

    address = [ "192.168.100.40/32" ]; # ip address of the virtual tunnel
    dns = [ "129.82.233.44" ]; # Dns server through the tunnel
    domains = [ "~engr.colostate.edu" ]; #

    # https://wiki.archlinux.org/title/WireGuard#systemd-networkd:_routing_all_traffic_over_WireGuard
    routingPolicyRules = [
      {
        Family = "both"; # Allow ipv4 and ipv6
        FirewallMark = firewallMark;
        InvertRule = true;
        Table = firewallMark;
        Priority = 10;
      }
    ];

    linkConfig.RequiredForOnline = "no";
  };

  #networking.wireguard.interfaces.csu-vpn = {
  #  ips = [ "192.168.100.40/32" ];
  #  privateKeyFile = config.age.secrets.wg-csu-private-key.path;
  #  peers = [{
  #    publicKey = "cdFaHjSCz3oe81Gyl/86W1th4Hj4LK3iORDCLZmF0gI=";
  #    presharedKeyFile = config.age.secrets.wg-csu-preshared-key.path;
  #    allowedIPs = [
  #      "129.82.0.0/16"
  #      "10.1.0.0/16"
  #      "10.2.0.0/16"
  #    ];
  #    endpoint = "129.82.233.44:52813";
  #    persistentKeepalive = 30;
  #  }];
  #};
}
