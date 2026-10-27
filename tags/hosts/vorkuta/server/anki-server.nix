{ config, ... }:
{
  services.anki-sync-server = {
    enable = true;
    address = "0.0.0.0";
    openFirewall = true;
    users = [
      {
         username = "ori";
         passwordFile = config.age.secrets."anki_password".path;
      }
    ];
  };
}
