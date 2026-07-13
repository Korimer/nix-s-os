{ den, ... }:
{
  den.aspects.magic.includes = [
    den.aspects.wireguard.provides.csu-vpn
    den.aspects.magic.provides.proton-vpn
  ];

  den.aspects.magic.provides.proton-vpn.nixos = { config, ... }: {
    my.secretGroups = [ "magic-proton-vpn" ];

    netNamespaces.toCreate.proton-netzach = {
      resolv = {
        dns = [
          "10.2.0.1"
          #"2a07:b944::2:1"
        ];
      };
    };

    netNamespaces.createFor.wireguard = {
      interfaces = [ "proton-magic" ];
      sockets = [ "proton-magic" ];
    };
    networking.wireguard.interfaces.proton-magic = {
      interfaceNamespace = "proton-vpn";
      socketNamespace = null; # aka init netns
      ips = [ "10.2.0.2/32" "2a07:b944::2:2/128" ];
      privateKeyFile = config.age.secrets.wg-magic-proton-key.path;
      peers = [{
        publicKey = "KMZgG0stim9wMWWyTkfznUoapniGju1a7/0mmzYlez4=";
        allowedIPs = [
          "0.0.0.0/0"
          #"::/0"
        ];
        endpoint = "95.173.221.219:51820";
        persistentKeepalive = 25;
      }];
    };
  };
}

