{ inputs, ... }:
{
  flake-file.inputs.korimer-waybar.url = "github:Korimer/Waybar-Config";
  den.aspects.korimer.provides.waybar.nixos = { pkgs, ... }:
    let
      custom-pkgs = {
        niri-taskbar = import ./_apps/niri-taskbar.nix { inherit pkgs; };
        waybar-fortune = import ./_apps/waybar-fortune.nix { inherit pkgs; };
      };

      powerline-bar-config =
        with custom-pkgs;
        import ./_config/bar.nix
        { inherit niri-taskbar; };

    in
    {
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
}
