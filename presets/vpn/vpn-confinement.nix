{ inputs, config, lib, ... }:
{
  imports = [ inputs.vpn-confinement.nixosModules.default ];

  # Automatically make a host entry for vpn namespaces
  # Eg, "proton" netns on a pc named "magic" gets "magic-proton.local"
  config.networking.hosts = lib.mapAttrs' 
    (namespace: settings:
      lib.nameValuePair
        settings.namespaceAddress
        [ "${config.networking.hostName}-${namespace}.local" ]
      )
    config.vpnNamespaces;
}
