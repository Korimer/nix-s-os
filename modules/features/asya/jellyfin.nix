{ inputs, ... }:
{
  flake-file.inputs.nixflix.url = "github:kiriwalawren/nixflix";

  den.aspects.asya.provides.jellyfin.nixos = { config, ... }:
  let
    Secret = name:
      { _secret = config.age.secrets."${name}.age".path; }; 
  in
  {
    imports = [ inputs.nixflix.nixosModules.default ];

    nixflix = {
      enable = true;
      nginx.enable = true;

      jellyfin = {
        enable = true;
        apiKey = Secret "jellyfin_base_apikey";
        users = {
          tosya = {
            mutable = false;
            policy.isAdministrator = true;
            password = Secret "tosya_pw";
          };
          marina = {
            mutable = false;
            policy.isAdministrator = false;
            password = Secret "marina_pw";
          };
        };
      };
    };
  };
}
