{ inputs }:
let
sep = import ./_seperators.nix { inherit inputs; };

allAttrs = {}
  // sep.divs.attrs
;
in
allAttrs
