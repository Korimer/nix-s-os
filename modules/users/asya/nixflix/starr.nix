{
  den.aspects.asya.provides.nixflix.provides.starr.nixos = { config, lib, ... }:
  let
    Secret = secret: { _secret = config.age.secrets.${secret}.path; };
    
    target_services = [
      "radarr"
      "sonarr"
      "sonarr-anime"
      "prowlarr"
      #"lidarr"
    ];

    starrBase = builtins.listToAttrs (
      (map (name: {
          name = name;
          value = {
            enable = true;
            config.waitForApiAttempts = 300;
            config.sleepOnFailSeconds = 5;
            config.apiKey = Secret "jellyfin_apikey_${name}";
            config.hostConfig.password = Secret "jellyfin_pw_${name}";
          };
        })
        target_services
      )
    );

    extendTimeout = postfix: builtins.listToAttrs (
      (map (name: {
          name = "${name}${postfix}";
          value = {
            serviceConfig.TimeoutStartSec = "30min";
          };
        })
        target_services
      )
    );

  in 
  {
    systemd.services = 
      (extendTimeout "")
      // (extendTimeout "config")
    ;
    nixflix = lib.attrsets.recursiveUpdate
      starrBase
    {
      jellyfin.waitForApiAttempts = 300;
      jellyfin.sleepOnFailSeconds = 5;

      downloadarr = {
        enable = true;
        qbittorrent.enable = true;
      };

      seerr = {
        enable = true;
        apiKey = Secret "jellyfin_apikey_seerr";
      };

      flaresolverr.enable = true;
      prowlarr.config.indexers = [
        # Blank for now
      ];
    };
  };
}

