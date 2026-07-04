let 
  Secret = config: name:
    config.age.secrets."${name}.age".path; 

  allInterfaces = {
    csu-vpn = {
      netns = {
        dns = "129.82.233.44";
      };
      wg = {
        privateKeyFile = "wg-csu-key";
        # AKA address 
        ips = [ "192.168.100.40/32" ];
        # TODO: Add DNS to network namespace
        #dns = [ "129.82.233.44" ];
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
in
{
  den.aspects.wireguard.provides.networks.provides.csu-vpn = {
    nixos = { config, ... }: {
      my.netns.csu-vpn = {
        dns = "129.82.233.44";
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
}
