{ inputs, den, ... }:
{
  flake-file.inputs.agenix.url = "github:ryantm/agenix";

  den.default.includes = [ den.aspects.agenix ];

  den.aspects.agenix = {
    includes = [
      den.aspects.agenix.provides.secret-options
      den.aspects.agenix.provides.secret-importing
    ];

    nixos = { pkgs, ... }: {
      imports = [ inputs.agenix.nixosModules.default ];
      environment.systemPackages = [ pkgs.ragenix ];

      age.identityPaths = [
        "/etc/ssh/ssh_host_ed25519_key"
      ];
    };

    provides.secret-options.nixos = { lib, ... }: {
      options.my.secretGroups = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        description = "Groups of secrets to import. Only import secrets you can decrypt!";
      };
    };

    provides.secret-importing.nixos = { config, ... }:
    let
      secretDir = inputs.self + "/secrets";
      allSecrets = import "${secretDir}/_secretList.nix";
      toImport = builtins.concatLists (map
        (group: allSecrets.secrets.${group})
        config.my.secretGroups
      );
      secretPaths = builtins.listToAttrs 
        (map (secret: {
            name = secret;
            value = { file = "${secretDir}/${secret}.age"; };
          })
          toImport
        );
    in
    {
      age.secrets = secretPaths;
    };
  };

}
