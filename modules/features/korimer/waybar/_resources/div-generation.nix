let
modules = import ./modules.nix;
colors = import ./colors.nix;
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
#matchflair = "(custom\/flair-(r|c|l)-(r|l))";
in
genAttrs ( filterMatch matchdiv )
#rec {
#  divs = {
#    modules = filterMatch matchdiv;
#    attrs = genAttrs divs.modules;
#    matcher = matchdiv;
#  };
#  flairs = {
#    modules = filterMatch matchflair;
#    attrs = genAttrs flairs.modules;
#    matcher = matchflair;
#  };
#}
