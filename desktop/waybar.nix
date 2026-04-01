{config, pkgs, ...}:
{
  programs.waybar.enable = true;

  environment.systemPackages = with pkgs; [
    wttrbar
    waybar
  ];
  
  autoMkLink.targets.
    "${config.environment.variables.NIXROOT}/static/desktop/waybar"
    = "/etc/xdg/waybar"
  ;
}
