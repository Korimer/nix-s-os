{ colors, ... }:
{
  name = "custom/power";
  settings = {
    format = "⏻ ";
    on-click = "wleave --layout /etc/wleave/layout.json --css /etc/wleave/style.css";
    tooltip = false;
  };
  style.base = {
    background-color = colors.magenta;
    border-radius = "0px 8px 8px 0px";
    padding = "0px 8px";
  };
}

