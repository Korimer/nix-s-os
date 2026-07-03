builtins.mapAttrs
(name: value: 
  (map (fname: "${fname}.age") value)
)
{
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
    "wg-csu-vpn-key"
  ];
}
