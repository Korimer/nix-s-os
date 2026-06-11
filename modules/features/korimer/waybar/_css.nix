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

lor = side: if side == "r" then "color" else "background-color";
flairTemplate = let elm = builtins.elemAt; in list: ''
#${builtins.replaceStrings ["/"] ["-"] (elm list 0)} {
  ${lor (elm list 2)}: ${colors."${elm list 1}"};
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
