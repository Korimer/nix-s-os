{ inputs }:
let
divs = import ./_divs.nix { inherit inputs; };
in
divs.attrs
