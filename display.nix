{...}: {
  
  systemd.tmpfiles.rules = [
    "L /run/gdm/.config/monitors.xml etc/nixos/system-specific/monitors.xml"
  ];
}
