{
  den.aspects.gnupg = {
    nixos = { pkgs, ... }: {
      programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
        pinentryPackage = pkgs.pinentry-bemenu;
      };

      environment.systemPackages = with pkgs; [
        sops age
      ];

      # I loathe your chud defaults gnome
      services.gnome = {
        gnome-keyring.enable = false;
        gcr-ssh-agent.enable = false;
        gnome-online-accounts.enable = false;
      };
    };
  };
}

