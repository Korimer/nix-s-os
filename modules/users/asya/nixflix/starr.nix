{
  den.aspects.asya.provides.nixflix.provides.starr.nixos = { config, ... }:
  let
    Secret = secret: { _secret = config.age.secrets.${secret}.path; };
    
    target_services = [
      "radarr"
      "lidarr"
      "sonarr"
      "prowlarr"
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
      };
    };
}
