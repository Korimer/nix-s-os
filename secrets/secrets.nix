let
  internal = import ./_secretList.nix;
  ownership = internal.ownership;
  secrets = internal.secrets;

  ##############################
  ##### 400 lines of logic #####
  ##############################

  pkgs = import (builtins.getFlake "nixpkgs") {};
  lib = pkgs.lib;

  GenPair = group: file: lib.nameValuePair
    file
    ownership.${group};

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
      cur_keys =
        if (acc ? ${x.name}) then acc.${x.name}.publicKeys else [];
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
