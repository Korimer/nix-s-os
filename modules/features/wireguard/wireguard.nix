{ den, ... }:
{
  # also see https://discourse.nixos.org/t/wireguard-dns-over-systemd-resolved/47306/13
  den.aspects.wireguard = {
    provides.all.includes =
      (builtins.attrValues den.aspects.wireguard.provides.networks.provides)
      ++ [
        den.aspects.netns
        den.aspects.firejail
      ]
    ;

    nixos = { config, ... }:
    let
      Secret = name:
        config.age.secrets."${name}.age".path;
    in
    {
      networking.wireguard = {
        interfaces = {
          wg-uni = {
            interfaceNamespace = "csu-vpn";
            # TODO: add secret key
            privateKey = "lmao"; # Secret "wg-edu-key";
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
    };
  };
}
