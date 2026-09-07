{
  den.aspects.syncthing.nixos = { config, ... }: {
    services.syncthing = {
      enable = true;
      openDefaultPorts = true;
      guiPasswordFile = config.age.secrets.agenix_pw.path;
      settings.gui.user = "admin";
      devices = {
        "netzach" = { id = "YIYS5YI-AFSTCSS-TKLY2O7-WROAXZG-VFGXWEU-QRA5YPL-Z4YUALG-GM4OJQQ"; };
      };
    };
  };
}
