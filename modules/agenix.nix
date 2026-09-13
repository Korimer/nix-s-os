{ inputs, den, ... }:
let
  secretDir = inputs.self + "/secrets";
  allSecrets = import "${secretDir}/_secretList.nix";

  mkSecretImport = config:
    let
      toImport = builtins.concatLists (map
        (group: allSecrets.secrets.${group})
        config.my.secretGroups
      );
    in
    builtins.listToAttrs (map (secret: {
        name = secret;
        value = { file = "${secretDir}/${secret}.age"; };
      })
      toImport
    );
in
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
      age.identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    };

    homeManager = { config, ... }: {
      imports = [ inputs.agenix.homeManagerModules.default ];
      age.identityPaths = [ "${config.home.homeDirectory}/.ssh/id_ed25519" ];
    };

    provides.secret-options = {
      nixos = { lib, ... }: {
        options.my.secretGroups = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
          description = "Groups of secrets to import.";
        };
      };

      homeManager = { lib, ... }: {
        options.my.secretGroups = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
          description = "Groups of secrets to import.";
        };
      };
    };

    provides.secret-importing = {
      nixos = { config, ... }: {
        age.secrets = mkSecretImport config;
      };

      homeManager = { config, ... }: {
        age.secrets = mkSecretImport config;
      };
    };
  };
}
