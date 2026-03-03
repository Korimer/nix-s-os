{...}:
{
  imports = [
    ./lab-system/static/configuration.nix
    ./lab-system/system-specific/core.nix
  ];

  environment.variables.NIXROOT = "/etc/nixos/lab-system/";
}
