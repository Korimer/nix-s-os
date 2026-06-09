{ inputs, den, lib, ... }:
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

  den.schema.user = {
    #classes = [ "homeManager" ];
    includes = [
      importNamespace
    ];
  };

  den.aspects.korimer = { config, lib, ... }: {
    includes = [
      ({host, user}: {includes = lib.attrValues config.provides;})
      ];
  };

  den.aspects.importAllUserProvides = { host, ... }: {
    includes = (lib.flatten (
          lib.mapAttrsToList (_: u: lib.attrValues (den.aspects.${u.name}.provides or {})) host.users
          )  );
  };
}
