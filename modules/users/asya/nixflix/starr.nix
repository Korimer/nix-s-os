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
            config.apiKey = Secret "jellyfin_apikey_${name}";
            config.hostConfig.password = Secret "jellyfin_pw_${name}";
          };
        })
        target_services
      )
    );
  in 
  {
    nixflix = lib.attrsets.recursiveUpdate
      starrBase
    {
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
      #  #{
      #  #  name = "DrunkenSlug";
      #  #  apiKey ._secret = config.sops.secrets."indexer-api-keys/DrunkenSlug".path;
      #  #}

      #  #{
      #  #  name = "NZBFinder";
      #  #  apiKey._secret = config.sops.secrets."indexer-api-keys/NZBFinder".path;
      #  #}

      #  #{
      #  #  name = "NzbPlanet";
      #  #  apiKey._secret = config.sops.secrets."indexer-api-keys/NzbPlanet".path;
      #  #}
      ];          
    };
  };
}

