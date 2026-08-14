{ den, inputs, pkgs, ... }:
let
  powerline-bar-config = import ./_config/bar.nix;

  custom-pkgs = {
    niri-taskbar = import ./_apps/niri-taskbar.nix { inherit pkgs; };
    waybar-fortune = import ./_apps/waybar-fortune.nix { inherit pkgs; };
  };
in
{
  flake-file.inputs.korimer-waybar.url = "github:Korimer/Waybar-Config";
  den.aspects.korimer.provides.waybar = 
  {
    includes = [ den.aspects.korimer.provides.waybar.provides.waybar-fortune ];

    nixos = { pkgs, ... }: {
      programs.waybar = {
        enable = true;
        bars.powerline = powerline-bar-config;
      };

      imports = [ inputs.korimer-waybar.nixosModules.default ];
      environment.systemPackages =
      (with pkgs; [
        waybar-lyric
        waybar-mpris
        gpu-usage-waybar
      ])
      ++ (with custom-pkgs; [
        niri-taskbar
        waybar-fortune
      ]);
    };
  };
}
