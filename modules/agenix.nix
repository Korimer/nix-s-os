{ inputs, den, ... }:
{
  flake-file.inputs.agenix.url = "github:ryantm/agenix";

  den.default.includes = [ den.aspects.agenix ];

  den.aspects.agenix.nixos = { pkgs, ... }: {
    imports = [ inputs.agenix.nixosModules.default ];
    environment.systemPackages = [ pkgs.ragenix ];
  };
}
