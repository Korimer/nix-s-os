{ config, presets, ... }:
{
  imports = [ presets.vpn ];
  my.secretGroups = [ "${config.networking.hostName}-proton-vpn" ];
  vpnNamespaces.proton = {
    enable = true;
    wireguardConfigFile = config.age.secrets."${config.networking.hostName}-proton-conf".path;
    allowedIngress = [];
    allowedEgress = [];
    portMappings = [];
    vpn.allowedTCPPorts = [];
    vpn.allowedUDPPorts = [];
  };
}

