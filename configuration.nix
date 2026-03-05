{...}:
{
  imports = [
    ./home-system/static/configuration.nix
    ./home-system/system-specific/core.nix
  ];

  environment.variables.NIXROOT = "/etc/nixos/home-system/";
}
