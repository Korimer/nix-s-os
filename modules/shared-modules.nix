{ inputs, den, lib, ... }:
let
  importNamespace = { user, ... }:
  {
    userpublic.usr.${user.name} = {name = user.name;};
  };

  allProvides = { config, lib, ... }: {
    includes = [
      ({host, user}: {includes = lib.attrValues config.provides;})
    ];
  };
in
{

  #imports = [
  #  (inputs.den.namespace "userpublic" true)
  #];

  #userpublic.usr = {};

  #den.schema.user = {
  #  includes = [
  #    ({ user, ... }: {
  #      ${user.aspect}.includes = [ allProvides ];
  #    })
  #  ];
  #};
  #  includes = [
  #    allProvides
  #  ];
  #};

  den.aspects.korimer = allProvides;
  den.aspects.asya = allProvides;

  #den.aspects.importAllUserProvides = { host, ... }: {
  #  includes = (lib.flatten (
  #        lib.mapAttrsToList (_: u: lib.attrValues (den.aspects.${u.name}.provides or {})) host.users
  #        )  );
  #};
}
