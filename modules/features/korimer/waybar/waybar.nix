{ flake-root, inputs, ... }:
let
  modules = import ./_resources/modules.nix;
  settings = import ./_resources/settings.nix;
  css = import ./_css.nix { inherit inputs; };
in
{
  den.aspects.korimer.provides.waybar.homeManager =
  {
    home.file."tmp.css".text = css;
    programs.waybar = {
      settings = [(
        {
          modules-left = modules.left;
          modules-center = modules.center;
          modules-right = modules.right;
        }
        // settings
      )];
      enable = true;
      systemd.enable = true;
      style = 
      #''
      #  @import "${flake-root.literal}/modules/features/korimer/waybar/style.css";
      #'' +
      css;
    };
  };
}
