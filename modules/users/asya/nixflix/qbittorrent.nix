{
  den.aspects.asya.provides.nixflix.provides.qbittorrent.nixos = { config, lib, pkgs, ... }:

  {
    systemd.services.qbittorrent.serviceConfig.LoadCredential =
      "bittorrent_webui_password:${config.age.secrets.jellyfin_pw_bittorrent_hashed.path}";

    systemd.services.qbittorrent.serviceConfig.ExecStartPre = lib.mkAfter [
      (pkgs.writeShellScript "qbittorrent-patch-password" ''
        set -euo pipefail

        config_file="${config.services.qbittorrent.profileDir}/qBittorrent/config/qBittorrent.conf"

        password_hash="$(${pkgs.coreutils}/bin/cat \
          "$CREDENTIALS_DIRECTORY/bittorrent_webui_password")"

        ${pkgs.gnused}/bin/sed -i \
          "s|^WebUI\\\\Password_PBKDF2=.*|WebUI\\\\Password_PBKDF2=$password_hash|" \
          "$config_file"
      '')
    ];

    nixflix.torrentClients.qbittorrent = {
      enable = true;
      vpn.enable = true;

      password._secret =
        config.age.secrets.jellyfin_pw_bittorrent.path;

      serverConfig.Preferences.WebUI = {
        Username = "admin";
        Password_PBKDF2 = "REPLACEME";
      };
    };
  };
}
