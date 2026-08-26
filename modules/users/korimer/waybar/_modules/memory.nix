{ colors, ... }:
{
  name = "memory";
  settings.format = "{}% ";
  style.base = {
    background-color = colors.orange;
    padding = "0px 10px";
  };
}

