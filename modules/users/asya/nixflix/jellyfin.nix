{ inputs, ... }:
{
  den.aspects.asya.provides.nixflix.provides.jellyfin.nixos = { config, lib, ... }:
  let
    Secret = name:
      { _secret = config.age.secrets."${name}.age".path; }; 
  in
  {
    nixflix.jellyfin = {
      enable = true;
      openFirewall = true;
      apiKey = Secret "jellyfin_base_apikey";

      # Blank = listen on all addresses; in theory
      network.localNetworkAddresses = lib.mkForce [ "0.0.0.0" ];

      users = {
        tosya = {
          mutable = false;
          policy.isAdministrator = true;
          password = Secret "tosya_pw";
        };
      };

      system.pluginRepositories = {
        "Jellyfin Enhanced" = {
          url = "https://raw.githubusercontent.com/n00bcodr/jellyfin-plugins/main/10.11/manifest.json";
          # Grab this via nix store prefetch-file
          hash = "sha256-p7krSVHskDRBQq2tCufmbd1ID3syPKwsvBR9obkWnyc=";
          enabled = true;
        };
        "IAmParadox" = {
          url = "https://www.iamparadox.dev/jellyfin/plugins/manifest.json";
          hash = "sha256-cuZnZrKNDfxNfZBR4GL8FALYFva5Ec3FflPgIHWpC60=";
          enabled = true;
        };
      };

      plugins =
      let fromRepo = inputs.nixflix.lib.jellyfinPlugins.fromRepo; in
      {
        "Jellyfin Enhanced" = {
          package = fromRepo {
            # because for some reason "latest" seems volatile
            version = "11.12.0.0";
            hash = "sha256-6r7/HExUJhwkRD58Y3YKT9Gidlas6UOmTsNcRJPFgpQ=";
            repository = "Jellyfin Enhanced";
          };
        };
        "Jellyfin Tweaks" = {
          package = fromRepo {
            version = "3.1.0.0";
            hash = "sha256-zDliISq/LhWmERRoo25BvoZCYIV5d++rDm3BjtlFErg=";
            repository = "Jellyfin Enhanced";
          };
        };
        "File Transformation" = {
          package = fromRepo {
            version = "2.5.11.0";
            hash = "sha256-RecLxMWjsrVc/nF3GxXNOcKs0pWOERib+r9UEz+D5+4=";
            repository = "IAmParadox";
          };
        };
      };
    };
  };
}
