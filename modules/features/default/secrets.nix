{ inputs, ... }:
let
  secretDir = inputs.self + "/secrets";
  secretRegistry = import "${secretDir}/_secretList.nix";

  secretsFlattened = builtins.concatLists
    (builtins.attrValues secretRegistry.secrets);

  secretsAll = builtins.listToAttrs 
    (map (secret: {
      name = secret;
      value = { file = "${secretDir}/${secret}.age"; };
      })
      secretsFlattened
    );
in
{
  den.aspects.default.provides.secrets = {
    nixos = {
      age.secrets = secretsAll;
    };
  };
}
