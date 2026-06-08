{ den, inputs, ... }:
{
  flake-file.inputs.noctalia-shell.url = "github:noctalia-dev/noctalia-shell";

  den.aspects.korimer.provides.noctalia-shell = {
    includes = [ den.aspects.niriconfig ];

    nixos = { pkgs, ... }:
    {
      niriconfig.niristartup.text = ''
        spawn-at-startup "qs" "-c" "noctalia-shell"
      '';

      environment.systemPackages = [
        inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
      systemd.user.services.noctalia-shell = {
        enable = true;
        after = [ "default.target" ];
        wantedBy = [ "default.target" ];
        description = "Runs noctalia shell, hopefully on startup";
        serviceConfig = {
          Type = "simple";
          ExecStart = ''/run/current-system/sw/bin/noctalia-shell'';
        };
      };
    };
  };

}
