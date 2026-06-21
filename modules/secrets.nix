{ lib, den, inputs, ... }:
{
  flake-file.inputs = {
    sops-nix.url = "github:Mic92/sops-nix";
  };
  
  den.default.includes = [ den.aspects.secrets ];
  den.aspects.secrets = {
    nixos = { pkgs, ... }: {
      services.pcscd.enable = true;
      programs.gnupg.agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-curses;
        enableSSHSupport = true;
      };
      environment.variables.GPG_TTY="$(tty)";
      environment.systemPackages = with pkgs; [ pinentry-curses ];
      services.gnome.gnome-online-accounts.enable = lib.mkForce false;
      services.gnome.gnome-keyring.enable = lib.mkForce false;
      programs.seahorse.enable = lib.mkForce false;
    };
  };
}
