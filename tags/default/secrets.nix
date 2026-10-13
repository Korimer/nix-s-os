{ inputs, pkgs, lib, config, ... }:
let
  secretDir = inputs.self + "/secrets";
  allSecrets = import "${secretDir}/_secretList.nix";

  mkSecretImport = groups:
    let
      toImport = builtins.concatLists (map
        (group: allSecrets.secrets.${group})
        groups
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
  imports = [ inputs.agenix.nixosModules.default ];

  config = {
    environment.systemPackages = [ pkgs.ragenix ];
    age.identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

    age.secrets = mkSecretImport config.my.secretGroups;
  };

  options.my.secretGroups = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [];
    description = "Groups of secrets to import.";
  };

}
