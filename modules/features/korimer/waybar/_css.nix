{ inputs }:
let
modules = import ./_modules.nix;
sep = import ./_seperators.nix { inherit inputs; };
colors = import ./_colors.nix { inherit inputs; };

makeCSS = template: targets: builtins.concatStringsSep "\n" (
  builtins.map
  template
  targets
);

divTemplate = let elm = builtins.elemAt; in list: ''
#${builtins.replaceStrings ["/"] ["-"] (elm list 0)} {
  color: ${colors."${(elm list 1)}"};
  background-color: ${colors."${(elm list 2)}"};
  font-size: 28px;
  margin: 0px;
}
'';

getAdjModuleColor = bar: side:
  let
  list =
    let key = {l="left";c="center";r="right";};
    in modules.${key.${bar}};
  first = builtins.elemAt list 1;
  last = builtins.elemAt ((builtins.length list) - 1);
  module = if side == "l" then first else last;
  moduleName = builtins.elemAt (builtins.match "custom\/.(*?)-") 1;
  in
  colors.${module};

flairTemplate = let elm = builtins.elemAt; in list: ''
#${builtins.replaceStrings ["/"] ["-"] (elm list 0)} {
  color: ${getAdjModuleColor (elm list 1) (elm list 2)};
  font-size: 28px;
  margin: 0px;
}
'';

divCSS = makeCSS divTemplate sep.divs.modules;
flairCSS = makeCSS flairTemplate sep.flairs.modules;

moduleCSS = builtins.concatStringsSep "\n" [
  divCSS
  flairCSS
];
in
moduleCSS
