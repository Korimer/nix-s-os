{config, lib, ...}:
{
  autoMkLink.targets = lib.mapAttrs'
    (key: val: lib.nameValuePair
      ("${config.environment.variables.NIXROOT}system-specific/auto-move/src/${key}")
      (val)
    )
    {
      "niri" = "/etc/niri";
    };
}
