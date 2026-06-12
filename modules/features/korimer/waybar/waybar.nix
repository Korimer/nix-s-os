{ flake-root, inputs, ... }:
let
  modules = import ./_resources/modules.nix;
  css = import ./_css.nix { inherit inputs; };
  attrs = import ./_attrs.nix { inherit inputs; };
in
{
  den.aspects.korimer.provides.waybar.homeManager =
  {
    home.file.tmp.text = css;
    programs.waybar = {
      settings = [(
      {
        modules-left = modules.left;
        modules-center = modules.center;
        modules-right = modules.right;
      }
      // attrs
      )];
      enable = true;
      systemd.enable = true;
      style = ''
        @import "${flake-root.literal}/modules/features/korimer/waybar/style.css";
      ''
      + css;
    };
  };
}
