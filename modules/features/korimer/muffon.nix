{ inputs, ... }:
{
  flake-file.inputs.muffon-OLD-REPLACE-WHEN-MERGED.url = "github::r-ryantm/nixpkgs/auto-update/muffon";
  den.aspects.korimer.provides.muffon.nixos = { pkgs, ... }:
  {
    environment.systemPackages = [
      inputs.muffon-OLD-REPLACE-WHEN-MERGED.legacyPackages.${pkgs.stdenv.hostPlatform.system}.muffon
    ];
  };
}
