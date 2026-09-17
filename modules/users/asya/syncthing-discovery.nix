{ den, ... }:
{
  den.aspects.asya.provides.syncthing-discovery-server = {
    includes = [ den.aspects.syncthing ];
    nixos = { pkgs, ... }: {

    # Ensure the package is available
      environment.systemPackages = [ pkgs.syncthing-discovery ];

      # Open ports in the firewall for the discovery server
      networking.firewall.allowedTCPPorts = [ 8443 ];

      # Create a systemd service for stdiscosrv
      systemd.services.stdiscosrv = {
        description = "Syncthing Private Discovery Server";
        wantedBy = [ "multi-user.target" ];
        after = [ "network.target" ];
        serviceConfig = {
          DynamicUser = true;
          StateDirectory = "stdiscosrv";
          WorkingDirectory = "/var/lib/stdiscosrv";
          ExecStart = "${pkgs.syncthing-discovery}/bin/stdiscosrv";
          Restart = "on-failure";
          RestartSec = "5s";
        };
      };
    };
  };
}
