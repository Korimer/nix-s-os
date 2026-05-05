{ den, korimer, lib, ... }:
{
  den.default = {config, ...}: {
    includes = [

    ];

    meta.allProvides = (lib.attrValues config.provides);

    allProvides = (lib.attrValues config.provides);
  };

  den.ctx.host = {

    includes = [
      den.aspects.importAllUserProvides
    ];
  };

  den.aspects.importAllUserProvides = { host, ... }: {
    includes = (lib.flatten (
  lib.mapAttrsToList (_: u: lib.attrValues (den.aspects.${u.name}.provides or {})) host.users
)  );
  };
}
