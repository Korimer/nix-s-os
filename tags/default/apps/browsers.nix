{ inputs, pkgs, ... }:
{
  programs.firefox.enable = true;
  environment.systemPackages = [
    inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
