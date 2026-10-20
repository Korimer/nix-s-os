{ pkgs, ... }:
{
  systemd.services.update-myaddr = {
    description = "Update myaddr.io dynamic DNS";
    serviceConfig = {
      Type = "oneshot";
      # Replace YOUR_SECRET_KEY with the key you received when claiming your name
      ExecStart = "${pkgs.curl}/bin/curl -fsS -d key=YOUR_SECRET_KEY -d ip=self https://myaddr.tools/update";
    };
  };

  systemd.timers.update-myaddr = {
    description = "Timer to update myaddr.io every hour";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "1h"; # You can change this to "15m" or "1d" if preferred
      Persistent = true;
    };
  };
}
