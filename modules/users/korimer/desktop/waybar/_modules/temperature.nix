{ colors, ... }:
{
  name = "temperature";
  settings = {
    critical-threshold = 80;
    format = "{temperatureC}°C ";
    format-critical = "{temperatureC}°C ";
    format-warning = "{temperatureC}°C ";
    hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
    thermal-zone = 2;
    warning-threshold = 60;
  };
  style.base = {
    background-color = colors.foreground;
    padding = "0px 10px";
  };
  style.bySelector.".critical" = {
    background-color = colors.red;
  };
  style.bySelector.".warning" = {
    color = colors.yellow;
  };
}

