{ lib, den, inputs, ... }:
{
  flake-file.inputs = {
    sops-nix.url = "github:Mic92/sops-nix";
  };
  
  den.default.includes = [ den.aspects.secrets ];
  den.aspects.secrets = {
    nixos = { pkgs, ... }: {
      services.gnome = {
        gnome-keyring.enable = true;
        gcr-ssh-agent.enable = true;
        gnome-online-accounts.enable = lib.mkForce false;
      };

      environment.sessionVariables = {
        SSH_AUTH_SOCK = "";
      };

      services.pcscd.enable = true;

      # Prevent SSH from managing its own agent
      programs.ssh.startAgent = false;
      programs.ssh.enableAskPassword = false;

      #services.openssh.settings.AddKeysToAgent = "yes";
      
      # GPG agent (GPG ONLY, NOT SSH)
      #programs.gnupg.agent = {
      #  enable = true;
      #  enableSSHSupport = false;
      #  pinentryPackage = pkgs.pinentry-qt;
      #};
      environment.systemPackages = with pkgs; [
        #pinentry-qt
      ];
    };
  };
}
