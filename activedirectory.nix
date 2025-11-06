#
# nixos-ad.nix -- Active Directory Client
#
# Join AD: sudo adcli join --domain=your.domain.com --user=administrator
#
{
  config,
  pkgs,
  ...
}: {
  #
  # Packages
  #
  environment.systemPackages = with pkgs; [
    vim
    # AD
    adcli
    krb5
    realmd
    samba
    sssd
  ];
  
  services.realmd.enable = true;
  
  security = {
    krb5 = {
      enable = true;
      settings = {
        libdefaults = {
          udp_preference_limit = 0;
          default_realm = "ENGR.COLOSTATE.EDU";
        };
      };
    };
    pam = {
      makeHomeDir.umask = "077";
      services.login.makeHomeDir = true;
      services.sshd.makeHomeDir = true;
    };

    sudo = {
      extraConfig = ''
        %lab\ admins ALL=(ALL:ALL) NOPASSWD: ALL
        Defaults:%domain\ admins env_keep+=TERMINFO_DIRS
        Defaults:%domain\ admins env_keep+=TERMINFO
      '';

      # Use extraConfig because of blank space in 'domain admins'.
      # Alternatively, you can use the GID.
      # extraRules = [
      #   { groups = [ "domain admins" ];
      #     commands = [ { command = "ALL"; options = [ "NOPASSWD" ]; }  ]; }
      # ];
    };
  };

  #
  # Services
  #
  services = {
    nscd = {
      enable = true;
      config = ''
        server-user nscd
        enable-cache hosts yes
        positive-time-to-live hosts 0
        negative-time-to-live hosts 0
        shared hosts yes
        enable-cache passwd no
        enable-cache group no
        enable-cache netgroup no
        enable-cache services no
      '';
    };

    sssd = {
      enable = true;
      config = ''
        [sssd]
        domains = engr.colostate.edu
        config_file_version = 2
        services = nss, pam

        [pam]
        offline_credentials_expiration = 365

        [domain/engr.colostate.edu]
        override_shell = /run/current-system/sw/bin/zsh
        krb5_store_password_if_offline = true
        cache_credentials = true
        account_cache_expiration = 365
        entry_cache_timeout = 14400
        krb5_realm = ENGR.COLOSTATE.EDU
        realmd_tags = manages-system joined-with-samba
        id_provider = ad
        fallback_homedir = /home/%u
        ad_domain = engr.colostate.edu
        use_fully_qualified_names = false
        ldap_id_mapping = true
        auth_provider = ad
        access_provider = ad
        chpass_provider = ad
        ad_gpo_access_control = permissive
        enumerate = true
      '';
    };
  };
}

