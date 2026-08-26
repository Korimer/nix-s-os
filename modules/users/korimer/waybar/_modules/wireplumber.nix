{ colors, ... }:
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

