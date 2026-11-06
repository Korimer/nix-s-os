{ inputs, lib, ... }:
{
  imports = [
    inputs.nixos-hardware.nixosModules.asus-fa507nv
  ];

  nvidia.prime.sync.amdgpuBusId = lib. mkForce "PCI:53:0:0";

  systemd.sleep.settings.Sleep.HibernateMode = "platform";
  boot.kernelParams = [
    "pcie_aspm=off"
    "acpi.prefer_microsoft_dsm_guid=1"
  ];
  system.stateVersion = "25.05";
}
