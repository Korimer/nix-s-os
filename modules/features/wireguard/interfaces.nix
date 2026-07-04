{
  den.aspects.wireguard.provides.networks.provides.csu-vpn = {
    nixos = { config, ... }: {
      my.secretGroups = [ "csu-vpn" ];

      my.netns.csu-vpn = {
        dns = [ "129.82.233.44" ];
      };

      networking.wireguard.interfaces.csu-vpn = {
        ips = [ "192.168.100.40/32" ];
        privateKey = config.age.secrets.wg-csu-key.path;
        peers = [{
          publicKey = "129.82.233.44";
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
