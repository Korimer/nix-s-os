{ inputs, ... }:
{
  nix.settings.allowed-users = [ "@wheel" ];
  nix.settings.trusted-users = [ "@wheel" ];

  security.sudo.wheelNeedsPassword = false;


  services.openssh = {
    enable = true;
    openFirewall = true;
    #challengeResponseAuthentication = false;
    allowSFTP = false;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      MaxAuthTries = 3;
      PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
    };
    extraConfig = ''
      AllowTcpForwarding yes
      X11Forwarding no
      AllowAgentForwarding no
      AllowStreamLocalForwarding no
      AuthenticationMethods publickey
      Match User asya
        PasswordAuthentication yes
        KbdInteractiveAuthentication yes
    '';
  };
  imports = with inputs.korimer-mini-server.nixosModules;
  [
  #  local-admin # aka asya <3
  #  default-packages
  #  garbage-collector
  #  firewall
  #  fail2ban
  #  ssh
  #  nix-trust
  ];
}

