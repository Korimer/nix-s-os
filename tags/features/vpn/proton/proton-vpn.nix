{ config, presets, ... }:
{
  imports = [ presets.vpn ];
  my.secretGroups = [ "${config.networking.hostName}-proton-vpn" ];
  vpnNamespaces.proton = {
    enable = true;
    namespaceAddress = "192.168.15.2"; # default is 192.168.15.1
    wireguardConfigFile = config.age.secrets."${config.networking.hostName}-proton-conf".path;
    allowedIngress = [];
    allowedEgress = [];
    portMappings = [];
    vpn.allowedTCPPorts = [];
    vpn.allowedUDPPorts = [];
  };
}

