let
  asya = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM2Ayztm9Ld1IQb7JHsN3ASmpHtZHJOEDzK3utkBCEg7";
  vorkuta = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPtD3dFec6xPv5Dspc+cAo/EBb135q5reLZQ0u+T7lOa";


  vorkutaAttrs = builtins.listToAttrs
  (map
    (secret: {
     name = secret;
     value = { publicKeys = [ vorkuta ];};
    })
    vorkutaSecrets
  );

  vorkutaSecrets = [
    "tosya_pw.age"
    "marina_pw.age"
    "pw_sonarr.age"
    "pw_radarr.age"
    "pw_recyclarr.age"
    "pw_lidarr.age"
    "pw_prowlarr.age"
    "jellyfin_base_apikey.age"
  ];
in
vorkutaAttrs
//
{
  #"armored-secret.age" = {
  #  publicKeys = [ vorkuta ];
  #  armor = true;
  #};
}
