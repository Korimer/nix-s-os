let
  webUiPort = 8080; # default webui port
  torrentingPort = 50202; # random bullshit
in
{
  services.qbittorrent = {
    enable = true;
    openFirewall = true;
    extraArgs = [
      "--confirm-legal-notice"
      "--torrenting-port=${torrentingPort}"
    ];
  };

  systemd.services.qbittorrent = {
    vpnConfinement = {
      enable = true;
      vpnNamespace = "proton";
    };
  };

  vpnNamespaces.proton = {
    vpn.allowedTCPPorts = [ torrentingPort ];
    vpn.allowedUDPPorts = [ torrentingPort ];
    
    # allows localhost:8080 to exist outside of the netns
    portMappings = [
      webUiPort
    ];
  };
}
