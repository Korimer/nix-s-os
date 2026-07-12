{ den, ... }:
{
  den.aspects.magic.includes = with den.aspects.magic.provides; [
    csu-vpn
    proton-vpn
  ];

  den.aspects.magic.provides.csu-vpn.nixos = { config, ... }: {
  #  my.secretGroups = [ "csu-vpn" ];

  #  netNamespaces.toCreate.csu-vpn = {
  #    resolv = {
  #      dns = [ "129.82.233.44" ];
  #      #extraOptions = ''
  #      #  search engr.colostate.edu
  #      #  options edns0
  #      #'';
  #    };
  #  };
  #  netNamespaces.createFor.wireguard = {
  #    interfaces = [ "csu-vpn" ];
  #    sockets = [ "csu-vpn" ];
  #  };
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
    };
    #my.netns.csu-vpn = {
    #  dns = [ "129.82.233.44" ];
    #};

    #networking.wireguard.interfaces.csu-vpn = {
    #  interfaceNamespace = "csu-vpn";
    #  socketNamespace = null; # aka init netns
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
  };

  den.aspects.magic.provides.proton-vpn.nixos = { config, ... }: {
  #  my.secretGroups = [ "proton-vpn" ];

  #  my.netns.proton-vpn = {
  #    dns = [ "10.2.0.1" "2a07:b944::2:1" ];
  #  };

  #  networking.wireguard.interfaces.proton-vpn = {
  #    interfaceNamespace = "proton-vpn";
  #    socketNamespace = null;
  #    ips = [ "10.2.0.2/32" "2a07:b944::2:2/128" ];
  #    privateKeyFile = config.age.secrets.wg-proton-private-key.path;
  #    peers = [{
  #      publicKey = "jYGCeCwc2fkhmaXOBJEHPwXHRdPbAhizTiG4zK5ycBc=";
  #      allowedIPs = [
  #        "0.0.0.0/0"
  #        "::/0"
  #      ];
  #      endpoint = "95.173.221.92:51820";
  #      persistentKeepalive = 25;
  #    }];
  #  };
  };
}

