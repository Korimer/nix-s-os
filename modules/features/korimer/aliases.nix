{ den, lib, flake-root, ... }:
{
  den.aspects.korimer.provides.shellAliases = {

    includes = lib.attrValues den.aspects.korimer.provides.shellAliases.provides;

    provides = {
      nhUpdate = { host, ... }: {
        nixos = { config, pkgs, ... }: {
          environment.shellAliases.update =
            "${pkgs.nh}/bin/nh os switch /etc/nixos --impure";
        };
      };
      writeFlake = {
        nixos = { pkgs, ... }:
        {
          environment.systemPackages = [
            (pkgs.writeShellScriptBin "write-flake" ''
             cd ${flake-root.literal}
             exec nix run .#write-flake
             '')
          ];
        };
      };
    };
  };
}
