{ inputs }:
let
modules = import ./_modules.nix;
divs = import ./_divs.nix { inherit inputs; };
colors = import ./_colors.nix { inherit inputs; };

moduleCSS = let elm = builtins.elemAt; in
builtins.concatStringsSep "\n" (
  builtins.map
    (list: ''
      #${builtins.replaceStrings ["/"] ["-"] (elm list 0)} {
        color: ${colors."${(elm list 1)}"};
        background-color: ${colors."${(elm list 2)}"};
        font-size: 28px;
        margin: 0px;
      }
    '')
    divs.divModules
);
in
moduleCSS
