{ colors, ... }:
{
  name = "cpu";
  settings = {
    format = "{usage:3}% ";
    tooltip = false;
  };
  style.base = {
    background-color = colors.yellow;
    padding = "0px 10px";
  };
}

