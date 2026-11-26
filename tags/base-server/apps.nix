{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    host.dnsutils
    tcpdump
  ];
}
