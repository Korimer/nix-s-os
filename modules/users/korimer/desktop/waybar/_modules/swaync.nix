{ colors, ... }:
{
  name = "custom/swaync";
  settings = {
    escape = true;
    exec = "swaync-client -swb";
    exec-if = "which swaync-client";
    format = "{icon}";
    format-icons = {
      notification = "<span foreground='red'><small><sup>⬤</sup></small></span>";
      none = " ";
      dnd-notification = "<span foreground='red'><small><sup>⬤</sup></small></span>";
      dnd-none = " ";
    };
    on-click = "sleep 0.1 && swaync-client -t -sw";
    on-click-right = "sleep 0.1 && swaync-client -d -sw";
    return-type = "json";
    tooltip = false;
  };
  style.base = {
    background-color = colors.yellow;
    border-radius = "8px 0px 0px 8px";
    padding = "0px 5px";
    padding-left = "10px";
  };
}

