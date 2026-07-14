let
in
{
  den.aspects.asya.provides.nixflix.provides.starr.nixos = { config, ... }:
  let
    Secret = secret: { _secret = config.sops.secrets.${secret}.path; };
    
    cfg = [
      "radarr"
      "lidarr"
      "recyclarr"
      "sonarr"
      "prowlarr"
    ];

    cfg_base = builtins.listToAttrs (
      map (name: {
        name = name;
        value = {
          enable = true;
          hostConfig.password = Secret "pw_${name}";
        };
      })
        cfg
    );
  in 
    cfg
    // 
    {
      
    };
}
