{ inputs, config, lib, ... }:
let
  toAgeFile = name: value:
  let
    
  in
  {
    name = lib.removeSuffix ".age" (baseNameOf name);
    value = {
      file = "${inputs.self}/${name}";
      enable = builtins.elem value.group config.my.secretGroups;
    };
  };

  secrets = import "${inputs.self}/secrets.nix"
    |> lib.mapAttrs' toAgeFile;
in
{
  options.my.secretGroups = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [];
    description = "Sets of secrets to import.";
  };

  config.age.secrets = secrets;
}
