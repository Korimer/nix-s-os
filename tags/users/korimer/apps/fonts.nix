{ inputs, pkgs, ... }:
{
  fonts.packages = [
    (pkgs.callPackage (inputs.self + /packages/probespeak/package.nix))
  ];
}
