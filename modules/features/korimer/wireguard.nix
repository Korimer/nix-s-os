{
  den.aspects.korimer.provides.wireguard = {
    nixos = { config, ... }:
    let
      Secret = name:
        config.age.secrets."${name}.age".path;
    in
    {
      networking.wg-quick = {
        interfaces = {
          wg-uni = {
            # TODO: add secret key
            privateKey = "lmao"; # Secret "wg-edu-key";
            address = [ "192.168.100.40/32" ];
            dns = [ "129.82.233.44" ];
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
