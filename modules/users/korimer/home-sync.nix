{ den, ... }:
{
  den.aspects.korimer.provides.home-sync = {
    includes = [ den.aspects.syncthing ];
    nixos = { user, ... }: {
      #services.syncthing.folders = {
      #  "HomeSync" = {
      #    path = "/home/${user.name}";
      #  };
      #};
    };
  };
}
