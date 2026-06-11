{ flake-root, ... }:
{
  den.korimer.provides.waybar = {
    nixos = {config, pkgs, ...}:
    {
      environment.systemPackages = with pkgs; [
        wttrbar
          waybar
      ];

      # Make sure Wayland + portals are properly wired
      xdg.portal = {
        enable = true;
        wlr.enable = true;
      };

      # Ensure DBus has appindicator support (tray icons)
      services.dbus.packages = with pkgs; [
        libappindicator
      ];

      autoMkLink.targets.
        "${config.environment.variables.NIXROOT}/static/desktop/waybar"
        = "/etc/xdg/waybar"
        ;
    };
    
    homeManager = { config, ... }:
    let
      trueDotFileDir = "${flake-root.literal}/git-submodules/dotfiles";
    in
    {
      #config.lib.file.mkOutOfStoreSymlink "${trueDotFileDir}/${value}";
    };
  };
}
