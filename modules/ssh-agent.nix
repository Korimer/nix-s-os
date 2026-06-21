{
  den.aspects.ssh-agent.nixos = { lib, ...}: {
    services.gnome.gnome-keyring.enable = lib.mkForce true;
  };
}
