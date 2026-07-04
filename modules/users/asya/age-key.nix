{ inputs, ... }:
let
  secretDir = inputs.self + "/secrets";
  allSecrets = import "${secretDir}/_secretList.nix";

  nixflixSecrets = allSecrets.secrets.nixflix;

  ageFiles = builtins.listToAttrs
  (map 
    (secret: {
      name = secret;
      value = { file = secretDir + "/${secret}"; };
    })
    nixflixSecrets
  );
in
{
  den.aspects.vorkuta.asya.nixos = {
    age.identityPaths = [
      "/home/asya/.ssh/id_ed25519"
    ];
    age.secrets = ageFiles;
  };
}
