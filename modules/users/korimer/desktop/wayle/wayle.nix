{
  den.aspects.korimer.provides.wayle = { user, ... }: {
    homeManager.services.wayle.enable = true;
    nixos = { config, pkgs, ... }: {
      systemd.services.wayle-resume = {
        description = "Restart wayle after resume";
        wantedBy = [ "suspend.target" "hibernate.target" "hybrid-sleep.target" ];
        after = [ "suspend.target" "hibernate.target" "hybrid-sleep.target" ];

        serviceConfig = {
          Type = "oneshot";
          User = "${user.userName}";
          ExecStart = "${pkgs.systemd}/bin/systemctl --user restart wayle.service";
        };
      };
    };
  };
}
