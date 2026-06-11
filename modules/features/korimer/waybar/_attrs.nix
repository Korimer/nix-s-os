{ inputs }:
let
sep = import ./_seperators.nix { inherit inputs; };

flairs = {
};

allAttrs = {}
  // sep.divs.attrs
  // flairs
;
in
allAttrs
