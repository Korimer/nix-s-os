{ den, ... }:
{
  den.aspects.korimer.provides.git = { user, ... }: {
    homeManager =  { config, lib, ...  }: {

      home.sessionVariables = {
        GIT_CONFIG_GLOBAL = "${config.home.homeDirectory}/.config/git/config";
      };

      programs.git = {
        enable = true;
        settings = {
          init.defaultBranch = "master";
          core.fileMode = false;
          push.autosetupremote=true;

          user = lib.mkIf (user.name == "korimer") {
            name = "Korimer";
            email = "thekclov@gmail.com";
          };
        };
      };
    };

  };
}
