{ den, ... }:
{
  den.aspects.netns.includes = builtins.attrValues den.aspects.netns.provides;

  den.aspects.netns.provides.options.nixos = { lib, ... }: {

    options.my.netns = lib.mkOption {
      type = lib.types.attrsOf (lib.types.submodule ({ ... }: {
        options = {
          enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Simple Declarative netns creation";
          };

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

  den.aspects.netns.provides.config.nixos = { config, lib, pkgs, ... }:
  let
    enabledNameservers = 
      (lib.attrsets.filterAttrs
        (name: value: value.enable)
        config.my.netns
      );
  in
  {

    config.environment.etc =
    let
      GenerateNameservers = cfg: builtins.concatStringsSep "\n" (
        map
          (server: "nameserver ${server}")
          cfg.dns
      );
      GenerateAllText = cfg: builtins.concatStringsSep "\n" (
        map
          (Generator: Generator cfg)
          [
            GenerateNameservers
          ]
      );
    in
    lib.mapAttrs'
      (name: value: {
        name = "netns/${name}/resolv.conf";
        value = { text = GenerateAllText value; };
      })
      enabledNameservers
    ;

    config.systemd.services =
    let
      GenerateNSService = name: {
        description = "Create network namespace ${name}";
        wantedBy = [ "multi-user.target" ];
        before = [ "network.target" ];

        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStart = ''
            ${pkgs.iproute2}/bin/ip netns add ${name}
          '';
          ExecStop = ''
            ${pkgs.iproute2}/bin/ip netns del ${name}
          '';
        };
      };
    in
    lib.mapAttrs'
      (name: value: {
        name = "netns-${name}";
        value = GenerateNSService name;
      })
      enabledNameservers
    ;
  };
}
