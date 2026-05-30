{ inputs, den, ... }:
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
    value = "${name}";
    }
  )
  home-items;

  hmAttrs = builtins.listToAttrs fileAttrs;

  in
{
  den.aspects.korimer.provides.external-dotfiles =  {

    homeManager = { config, self', inputs', lib, ...}:
      let
        #replace with lib.getExe self'.packages.flake-root;
        flakeRoot = "/etc/nixos"; 
        trueDotFileDir = "${flakeRoot}/git-submodules/dotfiles";
      in
    {
      programs.emacs.enable = true;
      xdg.configFile = builtins.mapAttrs
        (_: value:
         { source = config.lib.file.mkOutOfStoreSymlink "${trueDotFileDir}/${value}"; }
        )
        hmAttrs;
    };
  };
}
