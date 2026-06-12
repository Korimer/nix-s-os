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
      (name: value: "  ${name}: ${value};")
      target.attrs
    )
    ++ [ "}" ]
  );

moduleToSelector = name:
  if inputs.nixpkgs.lib.hasPrefix "custom/" name
  then "#${builtins.replaceStrings ["/"] ["-"] name}"
  else "#${builtins.baseNameOf name}";

moduleToCssKey = name: builtins.baseNameOf name;

getAdjModuleColor = bar: side:
  let
    list =
      let key = {l="left";c="center";r="right";};
      in modules.${key.${bar}};
    first = builtins.elemAt list 1;
    last = builtins.elemAt list ((builtins.length list) - 2);
    module = if side == "l" then first else last;
  in
    CSS.${moduleToCssKey module}.attrs.background-color;

divTemplate = {id, color, bg}:
{
  selector = moduleToSelector id;
  attrs = {
    color = colors.${color};
    background-color = colors.${bg};
    font-size = "28px";
    margin = "0px";
  };
};

flairTemplate = {id, bar, side}:
  {
    selector = moduleToSelector id;
    attrs = {
      color = getAdjModuleColor bar side;
      font-size = "28px";
      margin = "0px";
    } // CSS.${moduleToCssKey id}.attrs;
  };

colorOptions = builtins.concatStringsSep "|" ( builtins.attrNames colors );
matchrgx = "(custom\/(div|flair)-(${colorOptions}|r|c|l)-(${colorOptions}|r|l))";

dispatchTemplate = spec:
  let
    match = builtins.match matchrgx spec;
    elm = n: builtins.elemAt match n;
  in
    if match == null
      then CSS.${moduleToCssKey spec}
    else
      if (elm 1) == "div"
      then divTemplate {id=elm 0; color=elm 2; bg=elm 3;}
      else flairTemplate {id=elm 0; bar=elm 2; side=elm 3;}
  ;

moduleCSS = builtins.concatStringsSep "\n\n" (
  map
    (spec: convertToCss (dispatchTemplate spec))
    modules.all
);
in
moduleCSS
