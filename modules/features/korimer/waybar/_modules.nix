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
      "custom/flair-window-r"
  ];
  center = [
    "custom/flair-taskbar-l"
    "wlr/taskbar"
    "custom/flair-taskbar-r"
  ];
  right = [
    "custom/flair-cpu-l"
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
      "custom/flair-power-r"
  ];
  all = left ++ right ++ center;
}
