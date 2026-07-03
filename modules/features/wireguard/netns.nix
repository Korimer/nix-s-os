{ den, ... }:
{
  den.aspects.netns = {

    nixos = { config, lib, ... }: {
      networking.networkmanager.enable = true;

      networking.hosts = {
        "127.0.0.1" = ["localhost"];
        "127.0.1.1" = [config.networking.hostName];
      };

      options.my.netns = lib.mkOption {
        type = lib.types.attrsOf (lib.types.submodule ({ ... }: {
          options = {
            enable = lib.mkEnableOption "Simple Declarative netns creation";

            dns = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              default = [ ];
              example = [ "1.1.1.1" "8.8.8.8" ];
              description = "DNS servers for this namespace.";
            };
          };
        }));
      };


    };

    provides.firejail = {
      nixos = { firejail.enable = true; };
    };
  };
}
