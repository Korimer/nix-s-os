{ inputs, ... }:
let
colors = import ./_colors.nix;

barFromModules = modules: with modules; {
  barConfig = {
  };

  groups.resourceUsage = [ cpu memory ];
  groups.heatStats = [ cpu-temperature gpu-temperature ];

  modulesLeft = appendSeperators [
    swaync
    wireplumber
    privacy
    tray
    fortune
    ( customDivider " " colors.cyan )
  ];

  modulesCenter = [
    ( customDivider " " colors.cyan )
    workspaces
    ( customDivider " " colors.cyan )
  ];

  modulesRight = appendSeperators [
    lyrics
    { name = "group/resourceUsage";
      settings.orientation = "orthogonal";
      style = {
        base.background-color = colors.foreground;
        base.margin = "2px";
        bySelector." *".font-size = "11px";
      };
    }
    clock
    { name = "group/heatStats";
      settings.orientation = "orthogonal";
      style = {
        base.background-color = colors.foreground;
        base.margin = "2px";
        bySelector." *".font-size = "11px";
      };
    }
    battery
    power
  ];

  extraCss = ''
    * {
      font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
      font-size: 13px;
      margin: 0px;
      min-height: 16px;
      padding: 0px;
    }


    window#waybar {
      background-color: transparent;
      border-bottom: 0px;
      padding: 0px;
      transition-duration: .5s;
      transition-property: background-color;
    }

    window#waybar.empty {
      background-color: transparent;
    }

    window#waybar.hidden {
      opacity: 0.2;
    }

    #window {
      background-color: ${colors.blue};
    }
  '';
};

customDivider = symbol: color: ( dividerTemplate // {
  settings.format = symbol;
  style.base = dividerTemplate.style.base
    // { color = color; };
});

dividerTemplate = {
  name = "custom/divider";
  settings.format = "";
  style.base = {
    margin = "0px";
    font-size = "28px";
  };
};

toModule = path: args: {
  name = inputs.nixpkgs.lib.removeSuffix ".nix" (baseNameOf path);
  value =
    import path (
      args // { inherit inputs; inherit colors; } );
};

moduleFiles = map
  ( name: ./_modules/${name} )
  ( builtins.attrNames (builtins.readDir ./_modules) );

generateModules = args: builtins.listToAttrs (
  map (path: toModule path args) moduleFiles
);


generateDivider = left: right:
  dividerTemplate //
  {
    style.base = dividerTemplate.style.base
      //
      (if (left.style.base ? background-color)
        then { color = left.style.base.background-color; }
        else {})
      //
      (if (right.style.base ? background-color)
        then { background-color = right.style.base.background-color; }
        else {})
    ;
  };

lastElem = list: builtins.elemAt list ((builtins.length list)-1);

appendSeperators = moduleList: builtins.foldl'
  (acc: elem: if (builtins.length acc) == 0 then [ elem ] else
    let
      left = lastElem acc;
      right = elem;
    in
      acc ++
        [ (generateDivider left right) ( elem ) ]
    )
    []
    moduleList
  ;
in
{
  den.aspects.korimer.provides.waybar.provides.powerline.nixos = args@{pkgs, ...}:
  {
    programs.waybar.bars.powerline =
      barFromModules (generateModules args);
  };
}
