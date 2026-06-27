let
  asya = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM2Ayztm9Ld1IQb7JHsN3ASmpHtZHJOEDzK3utkBCEg7";
  vorkuta = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPtD3dFec6xPv5Dspc+cAo/EBb135q5reLZQ0u+T7lOa";


  vorkutaAttrs = builtins.listToAttrs
  (map
    (secret: {
     name = secret;
     value = { publicKeys = [ asya ];};
    })
    vorkutaSecrets
  );

  vorkutaSecrets = import ./_secretList.nix;
in
vorkutaAttrs
//
{
  #"armored-secret.age" = {
  #  publicKeys = [ vorkuta ];
  #  armor = true;
  #};
}
