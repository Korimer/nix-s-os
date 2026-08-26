{ colors, ... }:
{
  name = "battery";
  settings = {
    format = "{icon} {capacity}%";
    format-alt = "{time} {icon}";
    format-charging = " {capacity}%";
    format-full = " {capacity}%";
    format-icons = [ "" "" "" ];
    format-plugged = "{capacity}%";
    states = {
      critical = 15;
      warning = 30;
    };
  };
  style.base.background-color = colors.yellow;
}
