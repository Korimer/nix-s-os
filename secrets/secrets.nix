let
  hosts = {
    asya = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM2Ayztm9Ld1IQb7JHsN3ASmpHtZHJOEDzK3utkBCEg7";
    magic = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKvepbbA6/tH0NzokUcOccn9+dePRH5oy1+XXPKgIDlv";
    #vorkuta = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPtD3dFec6xPv5Dspc+cAo/EBb135q5reLZQ0u+T7lOa";
  };

  ownership = (with hosts; {
    nixflix = [ asya ];
    csu-vpn = [ magic ];
  });

  ##############################
  ##### 400 lines of logic #####
  ##############################

  pkgs = import (builtins.getFlake "nixpkgs") {};
  lib = pkgs.lib;

  secrets = import ./_secretList.nix;

  GenPair = group: file: lib.nameValuePair
    file ownership.${group};

  GenerateFileOwnerPairs = group: lib.foldl'
    (acc: x:
      acc ++ [(GenPair group x)]
    )
    []
    secrets.${group}
  ;

  allPairs = lib.flatten (map
    GenerateFileOwnerPairs
    (builtins.attrNames ownership)
  );

  allSecrets = lib.foldl'
    (acc: x: let
      cur_keys = acc.${x.name} or [];
    in 
    acc //
    {
      ${x.name}.publicKeys = lib.unique (cur_keys ++ x.value);
    })
    {}
    allPairs
  ;
in
allSecrets
