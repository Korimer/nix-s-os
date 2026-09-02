{ colors, ... }:
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

