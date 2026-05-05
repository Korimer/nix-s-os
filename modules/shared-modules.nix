{ userpublic, config, inputs, den, korimer, lib, ... }:
{
  den.default = {config, ...}: {
    includes = [

    ];

    meta.allProvides = (lib.attrValues config.provides);

    allProvides = (lib.attrValues config.provides);
  };

  den.ctx.host = {

    includes = [
      den.aspects.korimer
    ];
  };

  den.ctx.user = {
    includes = [

    #({ host, user }: {userpublic.${user.name} = user.name;})
    #({ host, user }: {includes = lib.attrValues den.aspects.${user.name}.provides;})
    ];
  };

  #imports = [ (inputs.den.namespace "userpublic" true) ];
#
  #userpublic.lol = "lmao";
#
  #lol.lol = "lol";

  den.aspects.korimer = { config, lib, ... }: {
    includes = [
      ({host, user}: {includes = lib.attrValues config.provides;})
      #({ host, user }: {userpublic.includes = lib.attrValues den.aspects.${user.name}.provides;})
      ];
  };
    #allProvides.includes = lib.attrValues den.aspects.korimer.provides;

  #den.aspects.korimer = { config, ... }: {
  #  allProvides.includes = lib.attrValues config.provides
  #  // [ ({pkgs, ...}: {nixos.environment.systemPackages = [pkgs.nh];}) ]
  #  ;
  #  };

  den.aspects.importAllUserProvides = { host, ... }: {
    includes = (lib.flatten (
          lib.mapAttrsToList (_: u: lib.attrValues (den.aspects.${u.name}.provides or {})) host.users
          )  );
  };
}
