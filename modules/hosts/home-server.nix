{ den, ... }:
{
  flake-file.inputs.korimer-mini-server.url = "github:Korimer/MinimalNixServer";
  den.hosts.aarch64-linux.vorkuta.users = {
    asya = {};
  };

  den.aspects.vorkuta = {
    includes = builtins.attrValues den.aspects.asya.provides;
    nixos = {
      networking.hostName = "vorkuta";
      nixpkgs.virtualization.forwardPorts = [{
        # roman numeral for 5 is v btw
        host.port = 11053;
      }];
    };
  };
}
