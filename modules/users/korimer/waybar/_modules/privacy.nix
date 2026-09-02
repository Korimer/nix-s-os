{ colors, ... }:
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
  style.base = {
    background-color = colors.foreground;
  };
}

