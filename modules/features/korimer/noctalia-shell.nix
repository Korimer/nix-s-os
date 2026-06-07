{ inputs, ... }:
{
  flake-file.inputs.url = "github:noctalia-dev/noctalia-shell";

  den.aspects.korimer.provides.noctalia-shell.nixos = { pkgs, ... }:
  {
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

}
