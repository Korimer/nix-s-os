{ inputs, flake-root, ... }:
{
  den.aspects.korimer.provides.muffon = {
    nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.muffon
      ];
    };
  };
}
