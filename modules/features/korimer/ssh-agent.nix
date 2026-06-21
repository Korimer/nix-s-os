{
  den.aspects.korimer.provides.ssh-agent.nixos = { lib, ...}: {
    services.gnome.gnome-keyring.enable = lib.mkForce true;
  };
}
