{ inputs, den, ... }:
let
  secretDir = inputs.self + "/secrets/_secretList.nix";
  allSecrets = import secretDir;

  ageFiles = builtins.listToAttrs
  (map 
    (secret: {
      name = secret;
      value = { file = secretDir + "/${secret}"; };
    })
    allSecrets
  );
in
{
  flake-file.inputs.agenix.url = "github:ryantm/agenix";

  den.default.includes = [ den.aspects.agenix ];

  den.aspects.agenix.nixos = { pkgs, ... }: {
    imports = [ inputs.agenix.nixosModules.default ];
    environment.systemPackages = [ pkgs.ragenix ];

    age.secrets = ageFiles;
  };
}
