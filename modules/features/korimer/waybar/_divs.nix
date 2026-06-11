{ inputs }:
let
modules = import ./_modules.nix;
colors = import ./_colors.nix;

colorOptions = builtins.concatStringsSep "|" (builtins.attrNames colors);
matchdiv = "(custom\/div-(${colorOptions})-(${colorOptions}))";
  divModules = builtins.filter
(mod: mod != null)
  (builtins.map
   (modname: builtins.match matchdiv modname)
   (modules.all)
  );

  divAttrs = builtins.listToAttrs 
    (map (mod: {
      name = builtins.head mod;
      value = {
        format = "";
        tooltip = false;
      };
    })
    modules
  );
in
{
  attrs = divAttrs;
  modules = divModules;
}
