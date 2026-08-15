{ inputs, ... }:
let
colors = import ./_colors.nix;
niri-workspaces = pkgs: inputs.niri-workspaces.packages.${pkgs.system}.default;


bar = pkgs: {
  barConfig = {
  };

  modulesLeft = [
    {
      name = "custom/flair-l-l";
      settings.format = "";
      style.base = {
        color = colors.yellow;
        font-size = "28px";
        margin = "0px";
      };
    }
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
    {
      name = "custom/div-swaync-wireplumber";
      settings = {
        format = "";
        tooltip = false;
      };
      style.base = {
        background-color = colors.blue;
        color = colors.yellow;
        font-size = "28px";
        margin = "0px";
      };
    }
    {
      name = "wireplumber";
      settings = {
        format = "{volume}% {icon}";
        format-icons = [ "" "" "" ];
        format-muted = "{volume}% 󰝟";
        max-volume = 150;
        on-click = "helvum";
        on-click-middle = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        scroll-step = 1;
      };
      style.base = {
        background-color = colors.blue;
        font-size = "18px";
        padding = "0px 10px";
      };
    }
    {
      name = "custom/div-wireplumber-privacy";
      settings = {
        format = "";
        tooltip = false;
      };
      style.base = {
        background-color = colors.foreground;
        color = colors.blue;
        font-size = "28px";
        margin = "0px";
      };
    }
    {
      name = "privacy";
      settings.modules = [
        {
          tooltip = true;
          tooltip-icon-size = 24;
          type = "screenshare";
        }
        {
          tooltip = true;
          tooltip-icon-size = 24;
          type = "audio-out";
        }
        {
          tooltip = true;
          tooltip-icon-size = 24;
          type = "audio-in";
        }
      ];
      style.base.background-color = colors.foreground;
    }
    {
      name = "custom/div-privacy-tray";
      settings = {
        format = "";
        tooltip = false;
      };
      style.base = {
        background-color = colors.purple;
        color = colors.foreground;
        font-size = "28px";
        margin = "0px";
      };
    }
    {
      name = "tray";
      settings = {
        icon-size = 18;
        spacing = 10;
      };
      style.base.background-color = colors.purple;
    }
    {
      name = "custom/div-tray-window";
      settings = {
        format = "";
        tooltip = false;
      };
      style.base = {
        background-color = colors.blue;
        color = colors.purple;
        font-size = "28px";
        margin = "0px";
      };
    }
    {
      name = "custom/fortune";
      settings = {
        exec = "waybar-fortune /etc/nixos/git-submodules/quotes/all.txt";
        interval = 1800;
        return-type = "json";
        tooltip = true;
      };
      style.base.background-color = colors.blue;
    }
    {
      name = "custom/flair-l-r";
      settings.format = " ";
      style.base = {
        color = colors.blue;
        font-size = "28px";
        margin = "0px";
      };
    }
  ];

  modulesCenter = [
    {
      name = "custom/flair-c-l";
      settings.format = " ";
      style.base = {
        color = colors.cyan;
        font-size = "28px";
        margin = "0px";
      };
    }
    {
      name = "cffi/workspaces";
      settings = {
        module_path = "${niri-workspaces pkgs}/lib/libwaybar_niri_workspaces_enhanced.so";
      };
      style.bySelector."#workspaces" = {
        background-color = colors.cyan;
        padding = "4px 10px";
      };
      style.bySelector." button.active" = {
        background-color = colors.blue;
        color = colors.foreground;
      };
      style.bySelector." button\:hover" = {
      };
    }
    {
      name = "custom/flair-c-r";
      settings.format = " ";
      style.base = {
        color = colors.cyan;
        font-size = "28px";
        margin = "0px";
      };
    }
  ];

  modulesRight = [
    {
      name = "custom/flair-r-l";
      settings.format = "";
      style.base = {
        color = colors.blue;
        font-size = "28px";
        margin = "0px";
      };
    }
    {
      name = "custom/lyrics";
      settings = {
        exec = "waybar-lyric --quiet";
        exec-if = "which waybar-lyric";
        format = "{icon} {0}";
        format-icons = {
          getting = "";
          lyric = "";
          music = "󰝚";
          no_lyric = "";
          paused = "";
          playing = "";
        };
        hide-empty-text = true;
        on-click = "waybar-lyric next";
        on-click-middle = "waybar-lyric play-pause";
        on-click-right = "waybar-lyric previous";
        return-type = "json";
      };
      style.base = {
        background-color = colors.blue;
        padding = "0 10px";
      };
    }
    {
      name = "custom/div-lyrics-cpu";
      settings = {
        format = "";
        tooltip = false;
      };
      style.base = {
        background-color = colors.yellow;
        color = colors.blue;
        font-size = "28px";
        margin = "0px";
      };
    }
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
    {
      name = "custom/div-cpu-memory";
      settings = {
        format = "";
        tooltip = false;
      };
      style.base = {
        background-color = colors.orange;
        color = colors.yellow;
        font-size = "28px";
        margin = "0px";
      };
    }
    {
      name = "memory";
      settings.format = "{}% ";
      style.base = {
        background-color = colors.orange;
        padding = "0px 10px";
      };
    }
    {
      name = "custom/div-memory-temperature";
      settings = {
        format = "";
        tooltip = false;
      };
      style.base = {
        background-color = colors.foreground;
        color = colors.orange;
        font-size = "28px";
        margin = "0px";
      };
    }
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
    {
      name = "custom/div-temperature-clock";
      settings = {
        format = "";
        tooltip = false;
      };
      style.base = {
        background-color = colors.orange;
        color = colors.foreground;
        font-size = "28px";
        margin = "0px";
      };
    }
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
    {
      name = "custom/div-clock-power";
      settings = {
        format = "";
        tooltip = false;
      };
      style.base = {
        background-color = colors.magenta;
        color = colors.orange;
        font-size = "28px";
        margin = "0px";
      };
    }
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
    {
      name = "custom/flair-r-r";
      settings.format = "";
      style.base = {
        color = colors.magenta;
        font-size = "28px";
        margin = "0px";
      };
    }
  ];

  #.niri-taskbar {
  #  background-color: red;
  #}
  #
  #.niri-taskbar button {
  #  background-color: green;
  #}
  #
  #.niri-taskbar button.focused {
  #  background-color: blue;
  #}
  extraCss = ''
    * {
      font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
      font-size: 13px;
      margin: 0px;
      min-height: 16px;
      padding: 0px;
    }


    window#waybar {
      background-color: transparent;
      border-bottom: 0px;
      padding: 0px;
      transition-duration: .5s;
      transition-property: background-color;
    }

    window#waybar.empty {
      background-color: transparent;
    }

    window#waybar.hidden {
      opacity: 0.2;
    }

    #window {
      background-color: ${colors.blue};
    }
  '';
};
in
{
  den.aspects.korimer.provides.waybar.provides.powerline.nixos = {pkgs, ...}: 
  {
    programs.waybar.bars.powerline = bar pkgs;
  };
}
