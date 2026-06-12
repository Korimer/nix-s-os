{
  flair-l-l.attrs = {

  };
  flair-l-r.attrs = {

  };
  flair-c-l.attrs = {

  };
  flair-c-r.attrs = {

  };
  flair-r-l.attrs = {

  };
  flair-r-r.attrs = {

  };

  swaync = {
    selector = "#custom-swaync";
    attrs = {
      padding = "0px 5px";
      border-radius = "8px 0px 0px 8px";
      padding-left = "10px";
      background-color = "@notification";
    };
  };

  wireplumber = {
    selector = "#wireplumber";
    attrs = {
      font-size = "18px";
      padding = "0px 10px";
      background-color = "@audio";
    };
  };

  workspaces = {
    selector = "#workspaces";
    attrs = {
      padding = "4px 10px";
      background-color = "@workspaces";
    };

    active = {
      selector = "#workspaces button.active";
      attrs = {
        background-color = "@blue";
        color = "@foreground";
      };
    };
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

    button = {
      selector = "#taskbar button";
      attrs = {
        padding = "1px 4px";
        margin = "0px 4px";
      };
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
      border = "white";
      background-color = "@temperature-normal";
      border-style = "solid";
      border-width = "4px 10px";
    };

    warning = {
      selector = "#temperature.warning";
      attrs.background-color = "@temperature-warning";
    };

    critical = {
      selector = "#temperature.critical";
      attrs.background-color = "@temperature-critical";
    };
  };

  clock = {
    selector = "#clock";
    attrs = {
      padding = "0px 10px";
      background-color = "@time";
    };
  };

  battery = {
    selector = "#battery";
    attrs = {
      background-color = "@battery";
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
