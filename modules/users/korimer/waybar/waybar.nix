{ den, inputs, flake-root, ... }:
let
  modules = import ./_resources/modules.nix;

  settings = import ./_settings.nix { inherit flake-root; };
  css = import ./_css.nix { inherit inputs; };
in
{
  flake-file.inputs.korimer-waybar.url = "github:Korimer/Waybar-Config";
  den.aspects.korimer.provides.waybar = 
  {
    includes = [ den.aspects.korimer.provides.waybar.provides.waybar-fortune ];

    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        waybar-lyric
        waybar-mpris
        gpu-usage-waybar
      ];
    };
    homeManager =
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
  };
}
