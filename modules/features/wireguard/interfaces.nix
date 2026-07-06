{
  den.aspects.wireguard.provides.networks.provides.csu-vpn = {
    nixos = { config, ... }: {
      my.secretGroups = [ "csu-vpn" ];

      netNamespaces.toCreate.csu-vpn = {
        resolv = {
          dns = [ "129.82.233.44" ];
          extraOptions = ''
            options edns0
          '';
        };
      };
      netNamespaces.createFor.wireguard = {
        interfaces = [ "csu-vpn" ];
        sockets = [ "csu-vpn" ];
      };
      networking.wireguard.interfaces.csu-vpn = {
        interfaceNamespace = "csu-vpn";
        socketNamespace = null; # aka init netns
        ips = [ "192.168.100.40/32" ];
        privateKeyFile = config.age.secrets.wg-csu-private-key.path;
        peers = [{
          publicKey = "cdFaHjSCz3oe81Gyl/86W1th4Hj4LK3iORDCLZmF0gI=";
          presharedKeyFile = config.age.secrets.wg-csu-preshared-key.path;
          allowedIPs = [
            "129.82.0.0/16"
            "10.1.0.0/16"
            "10.2.0.0/16"
          ];
          endpoint = "129.82.233.44:52813";
          persistentKeepalive = 30;
        }];
      };
    };
  };

  den.aspects.wireguard.provides.networks.provides.proton-vpn = {

  };
}
#nixos = {
#  my.secretGroups = [ "csu-vpn" ];
#
#  my.netns.csu-vpn = {
#    dns = [ "129.82.233.44" ];
#  };
#
#  networking.wireguard.interfaces.csu-vpn = {
#    interfaceNamespace = "csu-vpn";
#    socketNamespace = null; # aka init netns
#    ips = [ "192.168.100.40/32" ];
#    privateKeyFile = config.age.secrets.wg-csu-private-key.path;
#    peers = [{
#      publicKey = "cdFaHjSCz3oe81Gyl/86W1th4Hj4LK3iORDCLZmF0gI=";
#      presharedKeyFile = config.age.secrets.wg-csu-preshared-key.path;
#      allowedIPs = [
#        "129.82.0.0/16"
#        "10.1.0.0/16"
#        "10.2.0.0/16"
#      ];
#      endpoint = "129.82.233.44:52813";
#      persistentKeepalive = 30;
#    }];
#  };
#};
