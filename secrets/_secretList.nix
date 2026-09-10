rec {
  hosts = {
    asya = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM2Ayztm9Ld1IQb7JHsN3ASmpHtZHJOEDzK3utkBCEg7";
    magic = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKvepbbA6/tH0NzokUcOccn9+dePRH5oy1+XXPKgIDlv";
    netzach = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIiZEWc4KL5eZem3k6JXN3b+xBOeNwvJvxkQG8xx3GqQ";
    fortnite = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILEzpdGEuwiUO0BNklvtUycF6Rb084Y9oDKr3CG56x+c";
    #vorkuta = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPtD3dFec6xPv5Dspc+cAo/EBb135q5reLZQ0u+T7lOa";
  };

  ownership = (with hosts; {
    nixflix = [ asya ];
    csu-vpn = [ magic netzach ];
    netzach-proton-vpn = [ netzach ];
    magic-proton-vpn = [ magic ];
    syncthing = [ magic netzach fortnite ];
  });
  
  secrets = {
    nixflix = [
      "tosya_pw"
      "marina_pw"
      "jellyfin_wg_config"
      "jellyfin_pw_bittorrent"
      "jellyfin_pw_bittorrent_hashed"
      "jellyfin_pw_sonarr"
      "jellyfin_pw_radarr"
      "jellyfin_pw_lidarr"
      "jellyfin_pw_prowlarr"
      "jellyfin_pw_sonarr-anime"
      "jellyfin_apikey_base"
      "jellyfin_apikey_sonarr"
      "jellyfin_apikey_radarr"
      "jellyfin_apikey_lidarr"
      "jellyfin_apikey_prowlarr"
      "jellyfin_apikey_seerr"
      "jellyfin_apikey_sonarr-anime"
    ];
    csu-vpn = [
      "wg-csu-preshared-key"
      "wg-csu-private-key"
    ];
    netzach-proton-vpn = [
      "wg-netzach-proton-key"
    ];
    magic-proton-vpn = [
      "wg-magic-proton-key"
    ];
    syncthing = [
      "syncthing_pw"
    ];
  };
}
