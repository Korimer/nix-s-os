let 
  Secret = config: name:
    config.age.secrets."${name}.age".path; 

  allInterfaces = {
    csu-vpn = {
      netns = {
        dns = "129.82.233.44";
      };
      wg = {
        privateKeyFile = "wg-csu-vpn-key";
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
  den.aspects.wireguard.provides.networks.provides = builtins.mapAttrs
    (name: value: {
      value = { nixos = { config, ... }: {
        # Trivially set my custom netns config
        my.netns.${name} = value.netns;
        # Override the given secret to actually point to the obscured contents
        networking.wireguard.interfaces = {
          ${name} =
            value.wg
            // { privateKey = config.age.secrets.${value.wg.privateKey}.path; }
          ;
        };
      };};
    })
    allInterfaces;
  }
