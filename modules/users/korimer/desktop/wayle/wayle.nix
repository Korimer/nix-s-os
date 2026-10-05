{
  den.aspects.korimer.provides.wayle = { user, ... }: {
    homeManager.services.wayle.enable = true;
    nixos = { pkgs, ... }: {
      systemd.user.services.wayle = {
        serviceConfig = {
          # Dynamically find the highest numbered active wayland socket and export it right before starting
          # Resolves a problem where wayle disappears on hibernate resume
          ExecStartPre = "${pkgs.bash}/bin/bash -c 'systemctl --user set-environment WAYLAND_DISPLAY=$(basename $(ls -t $XDG_RUNTIME_DIR/wayland-[0-9]* 2>/dev/null | head -n1))'";
        };
      };
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
