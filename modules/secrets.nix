{ lib, den, inputs, ... }:
{
  flake-file.inputs = {
    sops-nix.url = "github:Mic92/sops-nix";
  };
  
  den.default.includes = [ den.aspects.secrets ];
  den.aspects.secrets = {
    nixos = { pkgs, ... }: {
      programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
        pinentryPackage = pkgs.pinentry-bemenu;
      };

      services.gnome = {
        gnome-keyring.enable = false;
        gcr-ssh-agent.enable = false;
        gnome-online-accounts.enable = false;
      };
    };
  };
}
