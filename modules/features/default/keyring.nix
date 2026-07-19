{ den, ... }:
{
  den.default.includes = [ den.aspects.gnome-keyring ];
  den.aspects.gnome-keyring.nixos = {

    services.gnome = {
      gnome-keyring.enable = true;
      gcr-ssh-agent.enable = true;
      gnome-online-accounts.enable = false;
    };
  };
}
