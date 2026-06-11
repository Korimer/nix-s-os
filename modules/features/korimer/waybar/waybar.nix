{ flake-root, inputs, ... }:
let
  modules = import ./_modules.nix;
  divCSS = import ./_css.nix { inherit inputs; };
  divs = import ./_attrs.nix { inherit inputs; };
in
{
  den.aspects.korimer.provides.waybar.homeManager =
  {
    home.file.tmp.text = divCSS;
    programs.waybar = {
      settings = [(
      {
        modules-left = modules.left;
        modules-center = modules.center;
        modules-right = modules.right;
      }
      // divs.attrs
      )];
      enable = true;
      systemd.enable = true;
      style = ''
        @import "${flake-root.literal}/modules/features/korimer/waybar/style.css";
      ''
      + divCSS;
    };
  };
}
