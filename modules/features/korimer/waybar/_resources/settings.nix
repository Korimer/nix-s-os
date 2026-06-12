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

  #"custom/div-wireplumber-workspaces" = {
  #  format = "";
  #};
}
