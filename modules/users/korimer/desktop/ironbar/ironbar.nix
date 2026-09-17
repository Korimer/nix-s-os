{
  den.aspects.korimer.provides.ironbar.nixos = { pkgs, lib, ... }:
  let
    pythonEnv = pkgs.python3.withPackages (ps: [
      ps.pygobject3
    ]);

    ironbarDeps = [
      pythonEnv
      pkgs.ironbar
      pkgs.upower
      pkgs.networkmanagerapplet
      pkgs.wleave
      pkgs.fortune
    ];
  in {
    # Necessary for battery
    services.upower.enable = true;
    systemd.user.services.ironbar = {
        enable = false;
        description = "Ironbar Autostart";
        wantedBy = [ "graphical-session.target" ];
        enableDefaultPath = false;

      serviceConfig = {
        ExecStart = "${pkgs.ironbar}/bin/ironbar";
        Restart = "on-failure";
        Environment = [
          "PATH=${lib.makeBinPath ironbarDeps}"
          "GI_TYPELIB_PATH=${pkgs.gtk3}/lib/girepository-1.0:${pkgs.glib.out}/lib/girepository-1.0"
        ];
      };
    };
  };
}
