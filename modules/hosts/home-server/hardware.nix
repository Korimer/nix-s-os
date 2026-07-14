{
  den.aspects.vorkuta.nixos = { pkgs, lib, ... }:
  {
    #Building

    # Hardware
    fileSystems = {
      "/" = {
        device = "/dev/disk/by-uuid/44444444-4444-4444-8888-888888888888";
        fsType = "ext4";
      };
    };
    swapDevices = [ { device = "/swapfile"; size = 1024; } ];

    hardware.enableRedistributableFirmware = true;

    # Boot
    boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest;
    boot.initrd.availableKernelModules = [ "usbhid" ];
    boot.loader.grub.enable = false;
    boot.loader.generic-extlinux-compatible.enable = true;
    boot.kernelParams = [
      "console=ttyS1,115200n8"
    ];
  };
}
