{ den, ... }:
{
  den.aspects.netns = {

    nixos = {
      networking.ifstate.enable = true;
      networking.networkmanager.enable = false;

      #networking.networkmanager.enable = true;

      #networking.hosts = {
      #  "127.0.0.1" = ["localhost"];
      #  "127.0.1.1" = [config.networking.hostName];
      #};
    };

    provides.firejail = {
      nixos = { firejail.enable = true; };
    };
  };
}
