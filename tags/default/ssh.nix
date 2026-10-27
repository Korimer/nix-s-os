{
  programs.ssh = {
    startAgent = true;
  };
  services.openssh = {
    enable = true;
    openFirewall = true;
  };
}
