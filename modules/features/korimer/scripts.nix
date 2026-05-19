{ den, lib, inputs, ... }:
{

  den.aspects.korimer.provides.personalScripts = { config, ... }: {

    includes = with den.aspects.korimer.provides.personalScripts.provides; [
      nhrebuild
    ];

    provides = {
      nhrebuild = { host, ... }: {
        nixos = { pkgs, ... }: {
          environment.systemPackages = [ (pkgs.writeShellApplication {
              name = "nhre";
              runtimeInputs = with pkgs; [ nh powershell git ];
              text = ''
              #!/usr/bin/env bash
              configdir="/etc/nixos/"
              versiontag="$(git -C "$configdir" log -1 --pretty='%h')"
              [[ -n "$(git -C "$configdir" status --porcelain)" ]] && versiontag="$versiontag-dirty"
              versiontag="$versiontag:$(git -C "$configdir" log -1 --pretty='%s' | tr ' ' '-')"
              behavior="build"
              [[ -n "''${1-}" ]] && behavior="$1"
              NIXOS_LABEL_VERSION="$versiontag" nh os "$behavior" --file "$configdir" "nixosConfigurations.${host.name}"
              '';
              }) ];
        };
      };
    };
  };
}
