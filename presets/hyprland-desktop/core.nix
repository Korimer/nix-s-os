{ pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  wayland.windowManager.hyprland.plugins = with pkgs.hyprlandPlugins; [
    hyprscroller
    hyprgrass
    hyprspace
    hyprtasking
    hyprsplit
  ];
}
