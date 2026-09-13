{
  den.aspects.default.provides.syncthing = { user, ... }: {
    nixos = {
      my.secretGroups = [ "syncthing" ];
      age.secrets.syncthing_pw = {
        owner = "korimer";
        mode = "0400";
      };
    };

    homeManager = { config, pkgs, osConfig, ... }: {
      services.syncthing = {
        enable = true;
        overrideDevices = true;
        overrideFolders = true;

        #guiCredentials = {
        #  username = "admin";
        #  passwordFile = osConfig.age.secrets.syncthing_pw.path;
        #};

        settings = {
          devices = {
            "netzach" = {
              id = "VIP72LK-LXIWNFB-XR7V2EG-S27ZRDX-FXYEY6K-QVRJYBZ-ABMDB5T-HNUKDQZ";
            };
          };

          folders = {
            "HomeSync" = {
              enable = true;
              id = "homesync";
              path = "~/Sync";
              devices = [ "netzach" ];
            };
          };
        };
      };
    };
  };
}
