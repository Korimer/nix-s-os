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
      "/jellyfin" = {
        device = "/dev/disk/by-uuid/9d6b3c5e-b3b8-4560-871a-b77323943fd0";
        fsType = "ext4";
      };
      "/data" = {
        device = "/dev/disk/by-uuid/ebea1fd5-81b8-412d-b9bf-249145aa8539";
        fsType = "ext4";
      };
    };
    swapDevices = [
      { device = "/data/swapfile"; priority = 100; }
      { device = "/swapfile"; size = 1024; priority = 1; }
    ];

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
