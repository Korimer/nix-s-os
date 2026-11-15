{ pkgs, inputs, ... }:
let
  
  mkPlugin = flake: plugname: inputs.${flake}.packages.${pkgs.stdenv.hostPlatform.system}.${plugname};
  mkSimplePlugin = plugname: mkPlugin plugname plugname;

  allPlugins = map mkSimplePlugin [
    "hyprgrass"            # Touch gestures
    "hypr-dynamic-cursors" # Cursor animation
  ]
  ++ [
    (mkPlugin "hyprland-plugins" "hyprfocus") # On-Focus animation
    (mkPlugin "hyprland-plugins" "hyprbars")  # Window titles
    (mkPlugin "hyprsplit" "hyprsplitlua")     # Per-monitor workspaces
    (mkPlugin "hyprspace" "Hyprspace")        # Workspace overview
  ]
  ;

  hypr-plugin-dir = pkgs.symlinkJoin {
    name = "hyrpland-plugins";
    paths = allPlugins;
  };

  hyprPkg = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  nixpkgs.overlays = with inputs.hyprland.overlays; [
    hyprland-packages
    hyprland-extras
  ];
  programs.hyprland = {
    package = hyprPkg;
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = { HYPR_PLUGIN_DIR = hypr-plugin-dir; };
}
