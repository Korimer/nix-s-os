{ inputs, ... }:
let
  secretFile = {sopsFile = inputs.self + "/secrets/jellyfin.yaml";};
  jellyfinSecrets = builtins.listToAttrs
  (map (name: {name=name; value=secretFile;})
  [
    "tosya_pw_default"
    "tosya_pw_sonarr"
    "tosya_pw_radarr"
    "tosya_pw_recyclarr"
    "tosya_pw_lidarr"
    "tosya_pw_prowlarr"
    "marina_pw"
    "jellyfin_base_apikey"
  ]);
in
{
  flake-file.inputs.nixflix.url = "github:kiriwalawren/nixflix";

  den.aspects.asya.provides.jellyfin.nixos = { config, ... }:
  let Secret = name: config.sops.secrets.${name}.path; in
  {
    sops.secrets = jellyfinSecrets;

    imports = [ inputs.nixflix.nixosModules.default ];

    nixflix = {
      enable = true;
      nginx.enable = true;

      jellyfin = {
        enable = true;
        users = {
          tosya = {
            mutable = false;
            policy.isAdministrator = true;
            password._secret = Secret "tosya_pw_default";
          };
          marina = {
            mutable = false;
            policy.isAdministrator = true;
            password._secret = Secret "marina_pw";
          };
          apikey = Secret "jellyfin_base_apikey";
        };
      };
    };
  };
}
