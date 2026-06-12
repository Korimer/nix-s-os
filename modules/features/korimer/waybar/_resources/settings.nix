let
  divs = import ./div-generation.nix;
in
divs //
{
  "custom/flair-l-l".format = ""; # "";
  "custom/flair-l-r".format = " ";
  "custom/flair-c-l".format = " ";
  "custom/flair-c-r".format = " ";
  "custom/flair-r-l".format = "";
  "custom/flair-r-r".format = "";

  tray = {
    icon-size = 18;
    spacing = 10;
  };

  cpu = {
    format = "{usage:3}% ";
    tooltip = false;
  };

  memory = {
    format = "{}% ";
  };

  temperature = {
    thermal-zone = 2;
    hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
    warning-threshold = 60;
    critical-threshold = 80;
    format = "{temperatureC}°C ";
    format-warning = "{temperatureC}°C ";
    format-critical = "{temperatureC}°C ";
  };

  clock = {
    timezone = "America/Denver";
    format = "{:%I:%M %p}";
    tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    format-alt = "{:%Y-%m-%d}";
  };

  "wlr/taskbar" = {
    on-click = "activate";
    on-click-middle = "close";
    on-click-right = "minimize";
  };

  wireplumber = {
    format = "{volume}% {icon}";
    format-muted = "{volume}% 󰝟";
    on-click = "helvum";
    on-click-middle = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    max-volume = 150;
    scroll-step = 1;
    format-icons = [ "" "" "" ];
  };

  privacy = {
    modules = [
      {
        type = "screenshare";
        tooltip = true;
        tooltip-icon-size = 24;
      }
      {
        type = "audio-out";
        tooltip = true;
        tooltip-icon-size = 24;
      }
      {
        type = "audio-in";
        tooltip = true;
        tooltip-icon-size = 24;
      }
    ];
  };

  battery = {
    states = {
      warning = 30;
      critical = 15;
    };

    format = "{icon} {capacity}%";
    format-charging = " {capacity}%";
    format-plugged = "{capacity}%";
    format-alt = "{time} {icon}";
    format-full = " {capacity}%";
    format-icons = [ "" "" "" ];
  };


  "custom/lyrics" = {
    return-type = "json";
    format = "{icon} {0}";
    hide-empty-text = true;

    format-icons = {
      playing = "";
      paused = "";
      lyric = "";
      music = "󰝚";
      no_lyric = "";
      getting = "";
    };

    exec-if = "which waybar-lyric";
    exec = "waybar-lyric --quiet";
    on-click = "waybar-lyric next";
    on-click-middle = "waybar-lyric play-pause";
    on-click-right = "waybar-lyric previous``";
  };

  "custom/power" = {
    format = "⏻ ";
    tooltip = false;
    on-click = "wleave --layout /etc/wleave/layout.json --css /etc/wleave/style.css";
  };

  "custom/swaync" = {
    tooltip = false;
    format = "{icon}";

    format-icons = {
      notification = "<span foreground='red'><small><sup>⬤</sup></small></span>";
      none = " ";
      dnd-notification = "<span foreground='red'><small><sup>⬤</sup></small></span>";
      dnd-none = " ";
    };

    return-type = "json";
    exec-if = "which swaync-client";
    exec = "swaync-client -swb";
    on-click = "sleep 0.1 && swaync-client -t -sw";
    on-click-right = "sleep 0.1 && swaync-client -d -sw";
    escape = true;
  };
  #"custom/div-wireplumber-workspaces" = {
  #  format = "";
  #};
}
