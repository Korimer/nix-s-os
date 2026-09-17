{
  den.aspects.default.provides.vorkuta-client.nixos = { config, ... }: {
    my.secretGroups = [ "vorkuta-client" ];
    security.pki.certificateFiles = [
    ];
  };
}
