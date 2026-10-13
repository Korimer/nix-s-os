{ lib, ... }:
{
  hardware.nvidia.powerManagement.finegrained = lib.mkForce true;
}
