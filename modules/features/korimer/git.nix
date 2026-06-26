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
          init.defaultBranch = "main";
          core.fileMode = false;
          push.autosetupremote=true;

          pull.ff = "only";

          credential.helper = "libsecret";

          safe.directory = "/etc/nixos";

          user.name = "Korimer";
          user.email = "thekclov@gmail.com";
        };
      };
    };

  };
}
