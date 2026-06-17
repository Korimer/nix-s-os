{ inputs, ... }:
{
  flake-file.inputs.korimer-mini-server.url = "github:Korimer/MinimalNixServer";

  den.aspects.vorkuta = {
    nixos =
    {
      imports = with inputs.korimer-mini-server.nixosModules;
      [
        local-admin # aka asya <3
        default-packages
        garbage-collector
        firewall
        fail2ban
        ssh
        nix-trust
      ];
    };
  };
}
