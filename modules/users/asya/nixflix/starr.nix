{
  den.aspects.asya.provides.nixflix.provides.starr.nixos = { config, ... }:
  let
    Secret = secret: { _secret = config.age.secrets.${secret}.path; };
    
    options = [
      "radarr"
      "lidarr"
      "sonarr"
      "prowlarr"
    ];

    starr_base = builtins.listToAttrs (
      (map (name: {
          name = name;
          value = {
            enable = true;
            config.apiKey = Secret "jellyfin_apikey_${name}";
            config.hostConfig.password = Secret "jellyfin_pw_${name}";
          };
        })
        options
      )
    );
  in 
    {
      nixflix = starr_base // {
      };
    };
}
