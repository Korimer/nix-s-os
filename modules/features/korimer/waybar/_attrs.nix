{ inputs }:
let
sep = import ./_seperators.nix;

flairs = {
};

allAttrs = {}
  // sep.divs.attrs
  // flairs
;
in
allAttrs
