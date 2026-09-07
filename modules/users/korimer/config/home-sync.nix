{ den, ... }:
{
  den.aspects.korimer.provides.home-sync = { user, ... }: {
    includes = [ den.aspects.syncthing ];
    nixos = {
      services.syncthing = {
        folders = {
          "HomeSync" = {
            path = "/home/${user.name}/Sync";
            devices = [ "netzach" ];
          };
        };
        settings = {
          #options.globalAnnounceServers = [
          #  "https://<your-discovery-server-ip-or-domain>:8443/?id=YOUR-STDISCOSRV-DEVICE-ID"
          #];
        };
      };
    };
  };
}
