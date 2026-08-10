{ den, inputs, ... }:
{
  flake-file.inputs.korimer-waybar.url = "github:Korimer/Waybar-Config";
  den.aspects.korimer.provides.waybar = 
  {
    includes = [ den.aspects.korimer.provides.waybar.provides.waybar-fortune ];

    nixos = { pkgs, ... }: {
      programs.waybar = {
        enable = true;
        bars.powerline = import ./_bar.nix;
      };

      imports = [ inputs.korimer-waybar.nixosModules.default ];
      environment.systemPackages = with pkgs; [
        waybar-lyric
        waybar-mpris
        gpu-usage-waybar
      ];
    };
  };
}
