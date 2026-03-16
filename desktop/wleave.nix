{config, ...}: {

  autoMkLink.targets.
    "${config.environment.variables.NIXROOT}/static/desktop/wleave"
    = "/etc/wleave"
  ;
}
