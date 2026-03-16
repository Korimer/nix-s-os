{config, ...}:
{
  assertions = [
    {
      assertion = config.systemd.user.services.waybar.enable == false;
      message = "we do not want waybar running on startup";
    }
  ];

  programs.waybar = {
    enable = true;
  };
  # Prevents nixos from auto-starting hyprbar (so we can defer it to the desktop manager)
  systemd.user.services.waybar.enable = false;
  
  autoMkLink.targets.
    "${config.environment.variables.NIXROOT}/static/desktop/waybar"
    = "/etc/xdg/waybar"
  ;
}
