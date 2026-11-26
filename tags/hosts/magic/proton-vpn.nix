{ config, presets, ... }:
let
  useIPV6 = false;
in
{
  imports = [ presets.vpn ];
  my.secretGroups = [ "magic-proton-vpn" ];

  netNamespaces.toCreate.proton-vpn = {
    resolv = {
      dns = [
        "10.2.0.1"
      ] ++ (if useIPV6 then [ "2a07:b944::2:1" ] else []);

      extraOptions = ''
        options edns0
      '';
    };
  };
  netNamespaces.createFor.wireguard = {
    interfaces = [ "proton-vpn" ];
    sockets = [ "proton-vpn" ];
  };
  networking.wireguard.interfaces.proton-vpn = {
    interfaceNamespace = "proton-vpn";
    socketNamespace = null; # aka init netns
    privateKeyFile = config.age.secrets.wg-magic-proton-key.path;
    ips = [
        "10.2.0.2/32"
      ] ++ (if useIPV6 then [ "2a07:b944::2:2/128" ] else []);

    peers = [{
      publicKey = "gPY2f/G0P9h29YcVFqKZ7w8kOdTae6g+Ent3y2DPIG8=";
      persistentKeepalive = 30;

      endpoint = if useIPV6
        then "[2a02:6ea0:d704:8097::10]:51820"
        else "95.173.221.217:51820"
      ;
      allowedIPs = [
        "0.0.0.0/0"
      ] ++ (if useIPV6 then [ "::/0" ] else []);
    }];
  };
}
