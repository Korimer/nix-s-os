{ inputs, lib, ... }:
{
  nix.settings.allowed-users = [ "@wheel" ];
  nix.settings.trusted-users = [ "@wheel" ];

  security.sudo.wheelNeedsPassword = false;


  # false by default when passwordAuthentication is false
  security.pam.services.sshd.unixAuth = lib.mkForce true;
  services.openssh = {
    enable = true;
    openFirewall = true;
    allowSFTP = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AuthenticationMethods = "publickey";
      AllowTcpForwarding = true;
      AllowAgentForwarding = false;
      AllowStreamLocalForwarding = false;
      X11Forwarding = false;
      MaxAuthTries = 3;
      PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
      # Dont ban myself
      PerSourcePenaltyExemptList = "192.168.0.0/16,127.0.0.0/8,::1/128";
    };

    # Match blocks must come after all global options.
    extraConfig = lib.mkAfter ''
      Match User asya
        AuthenticationMethods publickey
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

