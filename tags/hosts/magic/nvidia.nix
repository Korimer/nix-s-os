{ lib, ... }:
{
  hardware.nvidia = {
    powerManagement.finegrained = lib.mkForce true;
    prime = {
      offload.enable = lib.mkForce true;
      offload.enableOffloadCmd = lib.mkForce true;
      amdgpuBusId = "PCI:53:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
