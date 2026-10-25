let
  secretPath = ./resources/secrets;
  secretPathLiteral = "./resources/secrets";
  secretGroups = secretPath
    |> builtins.readDir
    |> builtins.attrNames
    ;

  membersOf = import ./resources/secret-ownership.nix;

  toSecretDef = groupName: secretFile: {
    name = "${secretPathLiteral}/${groupName}/${secretFile}";
    value = {
      publicKeys = membersOf.${groupName};
      group = groupName;
    };
  };

  secretDefinitions = group: "${secretPath}/${group}"
    |> builtins.readDir
    |> builtins.attrNames
    |> map (secret: toSecretDef group secret)
    |> builtins.listToAttrs
    ;

  allSecrets = secretGroups
    |> map secretDefinitions
    |> builtins.foldl' (acc: elem: acc // elem) {}
    ;
in
  allSecrets
