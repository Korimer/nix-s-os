rec {
  left = [
    "custom/flair-l-l"
    "custom/swaync"
      "custom/div-swaync-wireplumber"
      "wireplumber"
      "custom/div-wireplumber-workspaces"
      "niri/workspaces"
      "custom/div-workspaces-tray"
      "tray"
      "custom/div-tray-window"
      "niri/window"
      "custom/flair-l-r"
  ];
  center = [
    "custom/flair-c-l"
    "wlr/taskbar"
    "custom/flair-c-r"
  ];
  right = [
    "custom/flair-r-l"
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
      "custom/flair-r-r"
  ];
  all = left ++ right ++ center;
}
