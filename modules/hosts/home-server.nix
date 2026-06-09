{ inputs, ... }:
{
  flake-file.inputs.korimer-mini-server.url = "github:Korimer/MinimalNixServer";
  den.hosts.aarch64-linux.wired.users = {
    korimer = {
      aspect = {};
    };
  };

  den.aspects.wired = {
    includes = [ ];
    nixos = {
      imports = [ inputs.korimer-mini-server.flakeModules.complete ];
    };
  };
}
