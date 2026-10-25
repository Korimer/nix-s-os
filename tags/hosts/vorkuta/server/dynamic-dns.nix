{ pkgs, config, ... }:
{
  services.duckdns = {
    enable = true;
    domains = [ "funeralrubicon" ];
    tokenFile = config.age.secrets.duckdns_token.path;
  };
}
