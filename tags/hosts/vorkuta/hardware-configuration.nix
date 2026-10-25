{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "usb_storage" "usbhid" "bcm2835" "sdhci_iproc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/44444444-4444-4444-8888-888888888888";
      fsType = "ext4";
    };

  fileSystems."/data" =
    { device = "/dev/disk/by-uuid/ebea1fd5-81b8-412d-b9bf-249145aa8539";
      fsType = "ext4";
    };

  fileSystems."/jellyfin" =
    { device = "/dev/disk/by-uuid/9d6b3c5e-b3b8-4560-871a-b77323943fd0";
      fsType = "ext4";
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
