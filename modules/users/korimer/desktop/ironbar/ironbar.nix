{
  den.aspects.korimer.provides.ironbar.nixos = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      ironbar
      # Deps
      networkmanagerapplet
      wleave
    ];
    services.upower.enable = true;

    systemd.user.services.ironbar = {
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
