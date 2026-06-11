rec {
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
  all = left ++ right ++ center;
}
