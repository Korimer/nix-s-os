{
  den.aspects.default.provides.syncthing = { user, host }: {
    nixos = {
      my.secretGroups = [ "syncthing" "syncthing-${host.name}" ];
      age.secrets =
        let
        ownerTemplate = {
          owner = "${user.name}";
          mode = "0400";
        };
        in
        {
          syncthing_pw = ownerTemplate;
          "syncthing_key_${host.name}" = ownerTemplate;
          "syncthing_cert_${host.name}" = ownerTemplate;
        };
    };

    homeManager = { config, pkgs, osConfig, ... }: {
      services.syncthing = {
        enable = true;
        overrideDevices = true;
        overrideFolders = true;

        key = osConfig.age.secrets."syncthing_key_${host.name}".path;
        cert = osConfig.age.secrets."syncthing_cert_${host.name}".path;

        guiCredentials = {
          username = "admin";
          passwordFile = osConfig.age.secrets.syncthing_pw.path;
        };

        settings = {
          devices = {
            "netzach" =
              { id = "6YHTC4K-OJKAFYD-YNLFSLZ-FDLWDWD-SZ74KQP-ODTHEFP-JYUFRTO-4QWMYAP"; };
            "vorkuta" =
              { id = "MH42F24-CWHFKLT-TBSM4X6-6PT5E4E-E6GK7FV-W7VG6CL-TD2HII7-DKAMQAL"; };
            "fortnite" =
              { id = "PMUQNS6-YHEN3DN-VTHHF3R-HYEGNQE-GICN4I3-EB2OVOC-PS3OIPV-LNVYEAM"; };
            "magic" =
              { id = "WQVGMX2-Z73AOXX-5GI4XFN-NUWYLKV-JX4TKBL-UFTORCG-AE2YAX6-KQYGQQU"; };
          };

          folders = {
            "HomeSync" = {
              enable = true;
              id = "homesync";
              path = "~/Sync";
              devices = [ "netzach" "vorkuta" ];
            };
          };
        };
      };
    };
  };
}
