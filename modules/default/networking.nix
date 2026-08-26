{
  den.aspects.default.provides.networking.nixos = { pkgs, config, ... }: {
    networking.networkmanager.enable = true;
    environment.systemPackages = [ pkgs.networkmanagerapplet ];

    networking.hosts = {
      "127.0.0.1" = ["localhost"];
      "127.0.1.1" = [config.networking.hostName];
    };
  };
}
