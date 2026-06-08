{ ... }:
{
  den.aspects.niriconfig.nixos = { config, lib, ... }:
  {
    options.niriconfig = lib.mkOption {
      default = {};
      description = ''
        Named Niri configuration fragments.
      '';

      type = lib.types.attrsOf (lib.types.submodule {
        options = {
          priority = lib.mkOption {
            type = lib.types.int;
            default = 1000;
            description = "Ordering priority. Lower numbers are applied first.";
          };

          text = lib.mkOption {
            type = lib.types.lines;
            description = "KDL snippet to add to the generated config.";
          };
        };
      });
    };

    environment.etc."niri/nix-managed.kdl".text =
      let
        entries = lib.mapAttrsToList
          (name: value: value // { inherit name; })
          config.niriconfig;

        sortedEntries =
          builtins.sort
            (a: b: a.priority < b.priority)
            entries;
      in
        sortedEntries;
  };
}
