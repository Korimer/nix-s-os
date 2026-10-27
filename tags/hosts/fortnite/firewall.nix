{
  networking.firewall.allowPing = true;
  networking.firewall.extraCommands = ''
  iptables -A nixos-fw -p icmp --icmp-type echo-request -j ACCEPT
  iptables -I INPUT -j ACCEPT
'';

networking.firewall.extraStopCommands = ''
  iptables -D nixos-fw -p icmp --icmp-type echo-request -j ACCEPT || true
'';
}
