{

  den.aspects.asya.provides.nixflix.provides.qbittorrent.nixos = { config, ... }:
  {
    nixflix.torrentClients.qbittorrent = {
      enable = true;
      vpn.enable = true;
      password._secret = config.age.secrets.jellyfin_pw_bittorrent.path;
    };
  };
}
