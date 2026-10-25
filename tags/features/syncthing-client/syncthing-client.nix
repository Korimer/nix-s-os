{ pkgs, config, ... }:
{
  my.secretGroups = [ "syncthing" "syncthing-${config.networking.hostName}" ];
  environment.etc.coolthing.source = config.age.secrets."syncthing_pw".path;

  services.syncthing = {
    enable = true;
    overrideDevices = true;
    overrideFolders = true;

    key = config.age.secrets."syncthing_key_${config.networking.hostName}".path;
    cert = config.age.secrets."syncthing_cert_${config.networking.hostName}".path;

    settings = rec {
      # awesome scoping win
      gui.user = "admin";
      guipasswordFile = config.age.secrets.syncthing_pw.path;

      options.globalAnnounceServers = [ "https://38.246.23.117:8443" ];

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

      folders = 
      let allDevices = builtins.attrNames devices; in
      {
        "GlobalSync" = {
          path = "~/GlobalSync";
          devices = allDevices;
        };
        "NixSync" = {
          path = "/etc/nixos";
          devices = allDevices;
        };
      };
    };
  };
}
