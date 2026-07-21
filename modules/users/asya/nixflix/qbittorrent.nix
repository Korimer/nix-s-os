{
  den.aspects.asya.provides.nixflix.provides.qbittorrent.nixos = { config, lib, pkgs, ... }:
  {

    services.qbittorrent.serverConfig = {
      Preferences.WebUI = {
        Username = "admin";
        Password_PBKDF2 = "REPLACEME";
      };
    };
    
    systemd.services.qbittorrent.serviceConfig.ExecStartPre = lib.mkBefore ''
      cfg="${config.services.qbittorrent.profileDir}/qBittorrent/config/qBittorrent.conf"

      ${pkgs.gnused}/bin/sed -i \
        "s|^Preferences\\\\WebUI\\\\Password_PBKDF2=.*|Preferences\\\\WebUI\\\\Password_PBKDF2=$(cat ${config.age.secrets.jellyfin_pw_bittorrent_webui.path})|" \
        "$cfg"
    '';

    nixflix.torrentClients.qbittorrent = {
      enable = true;
      vpn.enable = true;

      password._secret =
        config.age.secrets.jellyfin_pw_bittorrent_webui.path;

      serverConfig.Preferences.WebUI = {
        Username = "admin";
        Password_PBKDF2 = "REPLACEME";
      };
    };
  };
}
