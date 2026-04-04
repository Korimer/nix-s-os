{...}:
{
  imports = [
    ./home-laptop/static/configuration.nix
    ./home-laptop/system-specific/core.nix
  ];

  environment.variables.NIXROOT = "/etc/nixos/home-laptop/";
}
