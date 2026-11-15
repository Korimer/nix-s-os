{ inputs, pkgs, self, ... }:
{
  fonts.packages = [
    self.packages.${pkgs.stdenv.hostPlatform.system}.probespeak-font
  ];
}
