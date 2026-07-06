rec {
  hosts = {
    asya = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM2Ayztm9Ld1IQb7JHsN3ASmpHtZHJOEDzK3utkBCEg7";
    magic = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKvepbbA6/tH0NzokUcOccn9+dePRH5oy1+XXPKgIDlv";
    netzach = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIiZEWc4KL5eZem3k6JXN3b+xBOeNwvJvxkQG8xx3GqQ root@fortnite";
    #vorkuta = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPtD3dFec6xPv5Dspc+cAo/EBb135q5reLZQ0u+T7lOa";
  };

  ownership = (with hosts; {
    nixflix = [ asya ];
    csu-vpn = [ magic netzach ];
  });

  
  secrets = {
    nixflix = [
      "tosya_pw"
      "marina_pw"
      "pw_sonarr"
      "pw_radarr"
      "pw_recyclarr"
      "pw_lidarr"
      "pw_prowlarr"
      "jellyfin_base_apikey"
    ];
    csu-vpn = [
      "wg-csu-preshared-key"
      "wg-csu-private-key"
    ];
  };
}
