{ presets, pkgs, ... }:
{
  imports = [ presets.mango-desktop ];
  environment.systemPackages = [ pkgs.vesktop ];
}

