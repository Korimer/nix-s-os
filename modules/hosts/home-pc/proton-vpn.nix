{
  den.aspects.netzach = {
    nixos = { config, ... }: {
      my.secretGroups = [ "netzach-proton" ];

      netNamespaces.toCreate.proton-netzach = {
        resolv = {
          dns = [
            "10.2.0.1"
            #"2a07:b944::2:1"
          ];
        };
      };

      netNamespaces.createFor.wireguard = {
        interfaces = [ "proton-netzach" ];
        sockets = [ "proton-netzach" ];
      };
      networking.wireguard.interfaces.proton-netzach = {
        interfaceNamespace = "proton-netzach";
        socketNamespace = null; # aka init netns
        ips = [ "10.2.0.2/32" "2a07:b944::2:2/128" ];
        privateKeyFile = config.age.secrets.wg-netzach-proton-key.path;
        peers = [{
          publicKey = "uQAr4o8x8M9aONM/nMu7DHLZCUobnRILlaTPmnD8ISw=";
          allowedIPs = [
            "0.0.0.0/0"
            #"::/0"
          ];
          endpoint = "84.17.63.54:51820";
          persistentKeepalive = 25;
        }];
      };
    };
  };
}
