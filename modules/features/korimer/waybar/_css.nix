{ inputs }:
let
colorsBases = import ./_resources/colors.nix;
modules = import ./_resources/modules.nix;
CSS = import ./_resources/css-template.nix;
colorscheme = import "${inputs.self}/modules/_nondendric/colorschemes/powerline.nix";

colors = builtins.mapAttrs
  (_: value: colorscheme.${value})
  colorsBases;

convertToCss = target:
  builtins.concatStringsSep "\n" (
    [ "${target.selector} {" ]
    ++ (inputs.nixpkgs.lib.mapAttrsToList
      (name: value: "${name}: ${value};")
      target.attrs
    )
    ++ [ "}" ]
  );

moduleToSelector = name:
  if inputs.nixpkgs.lib.hasPrefix "custom/" name
  then "#${builtins.replaceStrings ["/"] ["-"] name}"
  else "#${builtins.baseNameOf name}";

getAdjModuleColor = bar: side:
  let
    list =
      let key = {l="left";c="center";r="right";};
      in modules.${key.${bar}};
    first = builtins.elemAt list 1;
    last = builtins.elemAt ((builtins.length list) - 1);
    module = if side == "l" then first else last;
  in
    CSS.${moduleToSelector module}.background-color;

divTemplate = {id, color, bg}:
{
  header = builtins.replaceStrings ["/"] ["-"] id;
  attrs = {
    color = colors.${color};
    background-color = colors.${bg};
    font-size = "28px";
    margin = "0px";
  };
};

flairTemplate = {id, bar, side}:
  {
    header = builtins.replaceStrings ["/"] ["-"] id;
    attrs = {
      color = getAdjModuleColor bar side;
      font-size = "28px";
      margin = "0px";
    };
  };

colorOptions = builtins.concatStringsSep "|" ( builtins.attrNames colors );
matchrgx = "(custom\/(div|flair)-(${colorOptions}|r|c|l)-(${colorOptions}|r|l))";

dispatchTemplate = spec:
  let
    match = builtins.match matchrgx spec;
    elm = n: builtins.elemAt match n;
  in
    if match == null
      then CSS.${moduleToSelector spec}
    else
      if (elm 1) == "div"
      then divTemplate {id=elm 2; color=elm 3; bg=elm 4;}
      else flairTemplate {id=elm 2; bar=elm 3; side=elm 4;}
  ;

moduleCSS = builtins.concatStringsSep "\n" (
  map
    (spec: convertToCss (dispatchTemplate spec))
    (builtins.attrValues modules.all)
);
in
moduleCSS
