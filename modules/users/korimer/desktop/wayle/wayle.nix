{
  den.aspects.korimer.provides.wayle = { user, ... }: {
    homeManager.services.wayle.enable = true;
    nixos = { pkgs, ... }: {
      systemd.services.wayle-resume =
      let
        # aka, all kinds of sleep
        resumeTargets = [
        "suspend.target"
        "hibernate.target"
        "hybrid-sleep.target"
        "suspend-then-hibernate.target"
        ];
      in
      {
        description = "Restart wayle after system resume";
        after = resumeTargets;
        wantedBy = resumeTargets;

        serviceConfig = {
          Type = "oneshot";
          ExecStart = "${pkgs.systemd}/bin/systemctl --machine=korimer@.host --user restart wayle.service";
        };
      };
    };
  };
}
