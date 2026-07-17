{ den, ... }:
{
  den.default.includes = [ den.aspects.gnome-keyring ];
  den.aspects.gnome-keyring.nixos = {

    services.gnome = {
      gnome-keyring.enable = false;
      gcr-ssh-agent.enable = false;
      gnome-online-accounts.enable = false;
    };
  };
}
