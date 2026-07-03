let
  dns = "129.82.233.44";
  address = "192.0.2.0/32";
  namespace = "csu-vpn";
in
{
  den.aspects.wireguard.provides.networks.provides.${namespace}.nixos = 
  {
    environment.etc."netns/${namespace}/resolv.conf".text = ''
      nameserver ${dns}
      options edns0
    '';
    networking.ifstate.settings = {
      namespaces.${namespace} = {
        interfaces.veth0 = {
          addresses = [  ];
          link = {
            state = "up";
            kind = "veth";
            peer = "veth1";
            peer_netns = null; # grt
            address = "12:de:ad:be:ef:00";
          };
        };
      };
    };
  };
}

