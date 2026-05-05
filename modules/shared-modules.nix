{ userpublic, config, inputs, den, korimer, lib, ... }:
let
  importNamespace = { user, ... }:
  {
    userpublic.usr.${user.name} = {name = user.name;};
  };
in
{

  imports = [
    (inputs.den.namespace "userpublic" true)
  ];

  userpublic.usr = {};

  den.ctx.host = {

    includes = [
      den.aspects.korimer
    ];
  };

  #{nixos = {pkgs, ...}: { environment.systemPackages = [ pkgs.etcd ]; };}

  den.ctx.user = {
    includes = [
      importNamespace
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
