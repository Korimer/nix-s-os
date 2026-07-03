# How to use: the name is relevant for automatically detecting colorschemes,
# and subsequently adding correctly-colored powerline dividers (ily nerdfonts)
# Names are determined via builtins.baseName.
# For example, "custom/power-config" would look here for a "power-config" entry.
# Names are otherwise irrelevant - "selector" is what is actually used in the generated CSS.

{
  # Just an example for now
  flair-l-l.attrs = { };

  global = {
    selector = "*";
    attrs = {
      padding = "0px";
      margin = "0px";
      font-family = "FontAwesome, Roboto, Helvetica, Arial, sans-serif";
      font-size = "13px";
      min-height = "16px";
    };
  };

  window-waybar = {
    selector = "window#waybar";
    attrs = {
      background-color = "transparent";
      transition-property = "background-color";
      transition-duration = ".5s";
      border-bottom = "0px";
      padding = "0px";
    };
  };

  window-waybar-hidden = {
    selector = "window#waybar.hidden";
    attrs = {
      opacity = "0.2";
    };
  };

  window-waybar-empty = {
    selector = "window#waybar.empty";
    attrs = {
      background-color = "transparent";
    };
  };

  swaync = {
    selector = "#custom-swaync";
    attrs = {
      padding = "0px 5px";
      border-radius = "8px 0px 0px 8px";
      padding-left = "10px";
      background-color = "@swaync";
    };
  };

  fortune = {
    selector = "#custom-fortune";
    attrs.background-color = "@fortune";
  };

  wireplumber = {
    selector = "#wireplumber";
    attrs = {
      font-size = "18px";
      padding = "0px 10px";
      background-color = "@wireplumber";
    };
  };

  workspaces = {
    selector = "#workspaces";
    attrs = {
      padding = "4px 10px";
      background-color = "@workspaces";
    };
  };
  workspaces-active = {
    selector = "#workspaces button.active";
    attrs = {
      background-color = "@blue";
      color = "@foreground";
    };
  };
  workspaces-hover = {
    selector = "#workspaces button:hover";
    attrs = { };
  };

  tray = {
    selector = "#tray";
    attrs = {
      background-color = "@tray";
    };
  };

  window = {
    selector = "#window";
    attrs = {
      background-color = "@window";
    };
  };

  taskbar = {
    selector = "#taskbar";
    attrs = {
      padding = "4px 10px";
      background-color = "@taskbar";
    };

  };
  taskbar-button = {
    selector = "#taskbar button";
    attrs = {
      padding = "1px 4px";
      margin = "0px 4px";
    };
  };

  cpu = {
    selector = "#cpu";
    attrs = {
      padding = "0px 10px";
      background-color = "@cpu";
    };
  };

  memory = {
    selector = "#memory";
    attrs = {
      padding = "0px 10px";
      background-color = "@memory";
    };
  };

  temperature = {
    selector = "#temperature";
    attrs = {
      padding = "0px 10px";
      background-color = "@temperature";
    };
  };
  temperature-warning = {
    selector = "#temperature.warning";
    attrs.color = "@yellow";
  };
  temperature-critical = {
    selector = "#temperature.critical";
    attrs.background-color = "@red";
  };

  clock = {
    selector = "#clock";
    attrs = {
      padding = "0px 10px";
      background-color = "@clock";
    };
  };

  battery = {
    selector = "#battery";
    attrs = {
      background-color = "@battery";
    };
  };

  privacy = {
    selector = "#privacy";
    attrs = {
      background-color = "@privacy";
    };
  };

  lyrics = {
    selector = "#custom-lyrics";
    attrs = {
      background-color = "@lyrics";
      padding = "0 10px";
    };
  };

  power = {
    selector = "#custom-power";
    attrs = {
      padding = "0px 8px";
      border-radius = "0px 8px 8px 0px";
      background-color = "@power";
    };
  };
}
