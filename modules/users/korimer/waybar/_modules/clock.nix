{ colors, ... }:
{
  name = "clock";
  settings = {
    format = "{:%I:%M %p}";
    format-alt = "{:%Y-%m-%d}";
    timezone = "America/Denver";
    tooltip-format = "{:%Y %B}\n{calendar}";
  };
  style.base = {
    background-color = colors.orange;
    padding = "0px 10px";
  };
}

