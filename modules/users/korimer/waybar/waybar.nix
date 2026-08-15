{ inputs, den, ... }:
{
  flake-file.inputs.korimer-waybar.url = "github:Korimer/Waybar-Config";
  flake-file.inputs.niri-workspaces.url = "github:justbuchanan/waybar-niri-workspaces-enhanced";
  den.aspects.korimer.provides.waybar = {
    includes = [ den.aspects.korimer.provides.waybar.provides.powerline ];
    nixos = { pkgs, ... }:
    let
      custom-pkgs = {
        waybar-fortune = import ./_apps/waybar-fortune.nix { inherit pkgs; };
      };
    in
    {
      programs.waybar = {
        bars.powerline.enable = true;
        enable = true;
      };

      imports = [ inputs.korimer-waybar.nixosModules.default ];
      environment.systemPackages =
      (with pkgs; [
        waybar-lyric
        waybar-mpris
        gpu-usage-waybar
      ])
      ++ (with custom-pkgs; [
        waybar-fortune
      ]);
    };
  };
}
