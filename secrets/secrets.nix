let
  pkgs = import (builtins.getFlake "nixpkgs") {};
  lib = pkgs.lib;

  hosts = {
    asya = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM2Ayztm9Ld1IQb7JHsN3ASmpHtZHJOEDzK3utkBCEg7";
    magic = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKvepbbA6/tH0NzokUcOccn9+dePRH5oy1+XXPKgIDlv";
    #vorkuta = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPtD3dFec6xPv5Dspc+cAo/EBb135q5reLZQ0u+T7lOa";
  };

  secrets = import ./_secretList.nix;

  MapKeysTo = name: owners: lib.genAttrs
    secrets.${name}
    (_: { publicKeys = owners; })
  ;
  
  MergeAll = arrayOfAttrs: lib.zipAttrsWith
    (name: values: lib.concatLists values)
    arrayOfAttrs
  ;

  AsSecrets = ownership:
  let
    grouped = map
      (group: MapKeysTo group ownership.${group})
      (builtins.attrNames ownership);
  in
    MergeAll grouped
  ;
    
in
#MapKeysTo "nixflix" [ hosts.asya ]
AsSecrets
(with hosts; {
  nixflix = [ asya ];
  csu-vpn = [ magic ];
})
  #"armored-secret.age" = {
  #  publicKeys = [ vorkuta ];
  #  armor = true;
  #};
