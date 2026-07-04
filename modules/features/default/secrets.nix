{ inputs, ... }:
let
  secretDir = inputs.self + "/secrets";
  secret-registry = import "${secretDir}/_secretList.nix";

  secretsFlattened = builtins.concatLists
    (builtins.attrValues secret-registry.secrets);

  secretsAll = builtins.listToAttrs 
    (map (secret: {
      name = secret;
      value = { file = "${secretDir}/${secret}"; };
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
