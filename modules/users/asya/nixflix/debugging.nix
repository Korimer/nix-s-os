{

  den.aspects.asya.provides.nixflix.provides.jellyfin-debugging.nixos = { pkgs, lib, ... }:
  {
  };

  den.aspects.asya.provides.nixflix.provides.manual-ordering.nixos = { pkgs, lib, ... }:
    let
    Req = _: service: { requiredBy = [ "${service}.service" ]; };
  EnableRetry = list: builtins.listToAttrs 
    (map (service: {name = service; value = {
          serviceConfig = {
            Restart = "on-failure";
            RestartSec = 3000;
          };
          startLimitBurst = 5;
          startLimitIntervalSec = 3600;
          };})
      list
    );
  in
  {
    #systemd.services = EnableRetry [
    #  "jellyfin-api-key"
    #  "radarr-config"
    #  "sonarr-anime-config"
    #  "sonarr-config"
    #  "prowlarr-config"
    #];
  };
}
