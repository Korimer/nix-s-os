{
  den.aspects.default.provides.kernel.nixos = { pkgs, ... }:
  {
    # AKA LTS
    boot.kernelPackages = pkgs.linuxPackages;
  };
}
