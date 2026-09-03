{
  den.aspects.korimer.provides.ironbar.nixos = { pkgs, lib, ... }: {
    environment.systemPackages = [ pkgs.ironbar ];
    systemd.user.services.ironbar-startup = {
      enable = true;
      description = "Ironbar Autostart";
      wantedBy = [ "graphical-session.target" ];
      enableDefaultPath = false;

      serviceConfig = {
        ExecStart = lib.getExe pkgs.ironbar;
        Restart = "on-failure";
      };
    };
  };
}
