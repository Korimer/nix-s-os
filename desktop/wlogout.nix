{config, ...}: {

  autoMkLink.targets.
    "${config.environment.variables.NIXROOT}/static/desktop/wlogout"
    = "/etc/wlogout"
  ;
}
