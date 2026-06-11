{ inputs }:
let
modules = import ./_modules.nix;

colors = import ./_colors.nix { inherit inputs; };
colorOptions = builtins.concatStringsSep "|" (builtins.attrNames colors);

filterMatch = regex: builtins.filter
  (mod: mod != null)
  (builtins.map
   (modname: builtins.match regex modname)
   (modules.all)
  );

genAttrs = modules: builtins.listToAttrs 
  (map (mod: {
    name = builtins.head mod;
    value = {
      format = "";
      tooltip = false;
    };
  })
  modules
);

matchdiv = "(custom\/div-(${colorOptions})-(${colorOptions}))";
matchflair = "(custom\/flair-(${colorOptions})-(r|l))";
in
rec {
  divs = {
    modules = filterMatch matchdiv;
    attrs = genAttrs divs.modules;
  };
  flairs = {
    modules = filterMatch matchflair;
    attrs = genAttrs flairs.modules;
  };
}
