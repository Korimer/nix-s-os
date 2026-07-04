{
  den.aspects.default.provides.kernel.nixos = { pkgs, ... }:
  {
    boot.kernelPackages = pkgs.linuxPackages_lts;
  };
}
