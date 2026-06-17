{ currentSystem, ... }:
{
  den.aspects.vorkuta.nixos = {
    nixpkgs.buildPlatform = currentSystem;
    nixpkgs.hostPlatform = "aarch64-linux";
  };
}
