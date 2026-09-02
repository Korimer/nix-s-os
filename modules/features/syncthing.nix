{
  den.aspects.syncthing.nixos = {
    services.syncthing = {
      enable = true;
      openDefaultPorts = true;
    };
  };
}
