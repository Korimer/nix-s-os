{ inputs }:
let
colorscheme = import "${inputs.self}/modules/_nondendric/colorschemes/powerline.nix";
in
{
  swaync      = colorscheme.yellow;
  wireplumber = colorscheme.blue;
  workspaces  = colorscheme.cyan;
  tray        = colorscheme.purple;
  window      = colorscheme.blue;
  taskbar     = colorscheme.purple;
  cpu         = colorscheme.yellow;
  memory      = colorscheme.orange;
  temperature = colorscheme.green;
  clock       = colorscheme.orange;
  battery     = colorscheme.yellow;
  power       = colorscheme.magenta;
}
