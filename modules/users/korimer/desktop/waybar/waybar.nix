{ inputs, den, ... }:
{
  flake-file.inputs.korimer-waybar.url = "github:Korimer/Waybar-Config";
  flake-file.inputs.niri-workspaces.url = "github:justbuchanan/waybar-niri-workspaces-enhanced";
  den.aspects.korimer.provides.waybar.provides.powerline = {
    includes = [ den.aspects.korimer.provides.waybar.provides.powerline ];
    nixos = { pkgs, ... }:
    {
      programs.waybar = {
        enable = true;
        bars.powerline.enable = true;
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
