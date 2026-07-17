{
  den.aspects.asya.provides.nixflix.provides.starr.nixos = { config, lib, ... }:
  let
    Secret = secret: { _secret = config.age.secrets.${secret}.path; };
    
    target_services = [
      "radarr"
      "lidarr"
      "sonarr"
      "prowlarr"
    ];

    matchingServices =
      builtins.filter
        (service:
          builtins.any (name: builtins.match ".*${name}.*" service != null) target_services)
        (builtins.attrNames config.systemd.services);

    forceNamespace = service:
      { unitConfig.NetworkNamespacePath = lib.mkDefault "proton-vpn"; };

    starrNamespaces = builtins.listToAttrs (
      map ( name: {
          name = name;
          value = forceNamespace name;
        })
        matchingServices
    );

    starrBase = builtins.listToAttrs (
      (map (name: {
          name = name;
          value = {
            enable = true;
            config.apiKey = Secret "jellyfin_apikey_${name}";
            config.hostConfig.password = Secret "jellyfin_pw_${name}";
          };
        })
        target_services
      )
    );
  in 
    {
      nixflix =
        starrBase //
      {
      };

      #systemd.services = starrNamespaces;
    };
}
