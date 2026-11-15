# To include in your own config...
# in your flake inputs, include:
#  nfsm-flake.url = "github:gvolpe/nfsm";
#  korimer-flake = {
#    url = "github:Korimer/nix-s-os";
#    inputs.nfsm-flake.follows = "nfsm-flake";
#  };
# Then, anywhere else,
# modules = [ korimer-flake.nixosModules.nfsm-wrapper ] # or homeModules.nfsm-wrapper
# programs.niri.nfsm.enable = true;
# nfsm-module.nix
{ inputs, ... }:
let
  mkWrapper = pkgs: toWrap:
    let
      pre-patch = inputs.nfsm-flake.packages.${pkgs.stdenv.hostPlatform.system}.${toWrap};
    in
    pkgs.writeShellScriptBin toWrap ''
      export NFSM_SOCKET="/run/user/$(${pkgs.coreutils}/bin/id -u)/nfsm.sock"
      exec ${pkgs.lib.getExe pre-patch} "$@"
    '';

  mkOptions = lib: {
    programs.niri.nfsm.enable = lib.mkEnableOption "the nfsm-cli wrapper";
  };
in
{
  flake.nixosModules.nfsm-wrapper = { config, lib, pkgs, ... }: {
    options = mkOptions lib;

    config = lib.mkIf config.programs.niri.nfsm.enable {
      environment.systemPackages = [ (lib.hiPrio (mkWrapper pkgs "nfsm-cli")) ];
      systemd.user.services.nfsm-server = {
        description = "Automatically starts the nfsm server, running under your uid.";
        wantedBy = [ "graphical-session.target" ];
        serviceConfig.ExecStart = lib.getExe (mkWrapper pkgs "nfsm");
      };
    };
  };
  flake.homeModules.nfsm-wrapper = { config, lib, pkgs, ... }: {
    options = mkOptions lib;

    config = lib.mkIf config.programs.niri.nfsm.enable {
      home.packages = [ (lib.hiPrio (mkWrapper pkgs "nfsm-cli")) ];
      systemd.user.services.nfsm-server = {
        Unit.Description = "Automatically starts the nfsm server, running under your uid.";
        Install.WantedBy = [ "graphical-session.target" ];
        Service.ExecStart = lib.getExe (mkWrapper pkgs "nfsm");
      };
    };
  };
}
