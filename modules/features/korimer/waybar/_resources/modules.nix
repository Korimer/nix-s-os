rec {
  left = [
    "custom/flair-l-l"
    "custom/swaync"
    "custom/div-swaync-wireplumber"
    "wireplumber"
    "custom/div-wireplumber-privacy"
    "privacy"
    "custom/div-privacy-tray"
    "tray"
    "custom/div-tray-window"
    "custom/fortune"
    "custom/flair-l-r"
  ];
  center = [
    "custom/flair-c-l"
    "niri/workspaces"
    "custom/div-workspaces-taskbar"
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

