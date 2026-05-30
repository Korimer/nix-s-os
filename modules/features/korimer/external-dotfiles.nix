{ inputs, ... }:
let
  dotfileDir = "${inputs.self}/git-submodules/dotfiles";
  dotfileAttrs = builtins.readDir dotfileDir;

  home-items = builtins.filter
    ( name: dotfileAttrs.${name} == "directory" )
    (builtins.attrNames dotfileAttrs)
  ;
  
  fileAttrs = builtins.map 
    ( name: {
        name = "${name}";
        value = "${dotfileDir}/${name}";
      }
    )
    home-items;

  hmAttrs = builtins.listToAttrs fileAttrs;

in
{
  den.aspects.korimer.provides.external-dotfiles.homeManager = { config, ...}:
  {
    xdg.configFile = builtins.mapAttrs
      (_: value:
        { source = config.lib.file.mkOutOfStoreSymlink value; }
      )
      hmAttrs;
  };
}
