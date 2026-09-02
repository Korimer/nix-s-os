{ inputs, pkgs, colors, ... }:
let
  niri-workspaces = inputs.niri-workspaces.packages.${pkgs.system}.default;
in
{
  name = "cffi/workspaces";
  settings = {
    module_path = "${niri-workspaces}/lib/libwaybar_niri_workspaces_enhanced.so";
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

