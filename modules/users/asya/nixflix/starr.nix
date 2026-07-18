{
  den.aspects.asya.provides.nixflix.provides.starr.nixos = { config, ... }:
  let
    Secret = secret: { _secret = config.age.secrets.${secret}.path; };
    
    target_services = [
      "radarr"
      "sonarr"
      #"prowlarr"
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
    nixflix = starrBase //
    {
      seerr = {
        enable = true;
        apiKey = Secret "jellyfin_pw_seerr";
      };
      prowlarr.config.indexers = [
        #{
        #  name = "DrunkenSlug";
        #  apiKey ._secret = config.sops.secrets."indexer-api-keys/DrunkenSlug".path;
        #}

        #{
        #  name = "NZBFinder";
        #  apiKey._secret = config.sops.secrets."indexer-api-keys/NZBFinder".path;
        #}

        #{
        #  name = "NzbPlanet";
        #  apiKey._secret = config.sops.secrets."indexer-api-keys/NzbPlanet".path;
        #}
      ];          
    };
  };
}

