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
            config.sleepOnFailSeconds = 10;
            config.apiKey = Secret "jellyfin_apikey_${name}";
            config.hostConfig.password = Secret "jellyfin_pw_${name}";
            config.hostConfig.bindAddress = "0.0.0.0";
          };
        })
        target_services
      )
    );

    extendTimeout = service: {
      ${service} =
        { serviceConfig.TimeoutStartSec = lib.mkForce "30min"; };
    };

    timeoutStarr = postfix: lib.foldl (acc: val: acc // val ) {}
      (map 
        (service: extendTimeout "${service}${postfix}")
        target_services
      )
    ;

  in 
  {
    systemd.services = 
      (timeoutStarr "")
      // (timeoutStarr "-setup")
      // (timeoutStarr "-jellyfin")
      // (timeoutStarr "-config")
      // (extendTimeout "jellyfin-plugins")
      // (extendTimeout "jellyfin-api-key")
      // (extendTimeout "radarr-delayprofiles")
    ;
    nixflix = lib.attrsets.recursiveUpdate
      starrBase
    {
      jellyfin.waitForApiAttempts = 200;
      jellyfin.sleepOnFailSeconds = 30;

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

