{config, pkgs, ...}:
{

  environment.systemPackages = with pkgs; [
    wttrbar
    waybar
  ];
  
  autoMkLink.targets.
    "${config.environment.variables.NIXROOT}/static/desktop/waybar"
    = "/etc/xdg/waybar"
  ;
}
