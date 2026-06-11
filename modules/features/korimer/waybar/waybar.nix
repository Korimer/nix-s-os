{ flake-root, inputs, ... }:
{
  den.aspects.korimer.provides.waybar.homeManager = { config, ... }:
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
  matchdiv = "custom\/div-(${colorOptions})-(${colorOptions})";
  customModules = builtins.filter
    (mod: mod != null)
    (builtins.map
      (modname: builtins.match matchdiv modname)
      (allmodules)
    );
  in
  {
    programs.waybar = {
      settings = [{
        modules-left = modules.left;
        modules-center = modules.center;
        modules-right = modules.right;
      }];
      enable = true;
      systemd.enable = true;
      style = ''
        @import "${flake-root.literal}/modules/features/korimer/waybar/style.css"
      '';
    };
  };
}
