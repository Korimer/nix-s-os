{ flake-root, inputs, ... }:
let
colorscheme = import "${inputs.self}/modules/_nondendric/colorschemes/powerline.nix";
colors = {
  swaync      = colorscheme.yellow;
  wireplumber = colorscheme.blue;
  workspaces  = colorscheme.cyan;
  tray        = colorscheme.purple;
  window      = colorscheme.blue;
  taskbar     = colorscheme.purple;
  cpu         = colorscheme.yellow;
  memory      = colorscheme.orange;
  temperature = colorscheme.green;
  clock       = colorscheme.orange;
  battery     = colorscheme.yellow;
  power       = colorscheme.magenta;
};

modules = {
  left = [
    "custom/swaync"
      "custom/div-swaync-wireplumber"
      "wireplumber"
      "custom/div-wireplumber-workspaces"
      "niri/workspaces"
      "custom/div-workspaces-tray"
      "tray"
      "custom/div-tray-window"
      "niri/window"
      "custom/window-r-flair"
  ];
  center = [
    "wlr/taskbar"
  ];
  right = [
    "custom/cpu-l-flair"
      "cpu"
      "custom/div-cpu-memory"
      "memory"
      "custom/div-memory-temperature"
      "temperature"
      "custom/div-temperature-clock"
      "clock"
      "battery"
      "custom/div-clock-power"
      "custom/power"
      "custom/power-r-flair"
  ];
};

allmodules = modules.left ++ modules.right ++ modules.center;

colorOptions = builtins.concatStringsSep "|" (builtins.attrNames colors);
matchdiv = "(custom\/div-(${colorOptions})-(${colorOptions}))";
divModules = builtins.filter
  (mod: mod != null)
  (builtins.map
    (modname: builtins.match matchdiv modname)
    (allmodules)
  );

divAttrs = builtins.listToAttrs 
  (map (mod: {
      name = builtins.head mod;
      value = {
        format = "";
        tooltip = false;
      };
    })
    divModules
  );

divCSS = let elm = builtins.elemAt; in
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
    divModules
);
in
{
  den.aspects.korimer.provides.waybar.homeManager =
  {
    home.file.tmp.text = divCSS;
    programs.waybar = {
      settings = [(
      {
        modules-left = modules.left;
        modules-center = modules.center;
        modules-right = modules.right;
      }
      // divAttrs
      )];
      enable = true;
      systemd.enable = true;
      style = ''
        @import "${flake-root.literal}/modules/features/korimer/waybar/style.css";
      ''
      + divCSS;
    };
  };
}
