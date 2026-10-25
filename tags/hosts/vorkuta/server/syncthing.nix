{ pkgs, ... }: {

  environment.systemPackages = [ pkgs.syncthing-discovery ];

  # Open ports in the firewall for the discovery server
  networking.firewall.allowedTCPPorts = [ 8443 ];

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
}
