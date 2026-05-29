{ inputs, ... }:
let
  home-items = builtins.readDir inputs.self;
in
{
  den.aspects.korimer.provides.external-dotfiles.homeManager = { lib, ...}:
  {
    #lib.mapAttrs
  };
}
