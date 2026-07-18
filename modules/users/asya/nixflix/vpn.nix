{
  den.aspects.asya.provides.nixflix.provides.vpn.nixos = { config, ... }:
  {
    nixflix.vpn = {
      enable = true;
      accessibleFrom = [ "192.168.1.0/24" ];
      wgConfFile = config.age.secrets.jellyfin_wg_config.path;
    };
  };
}
