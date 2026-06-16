{ den, ... }:
{
  flake-file.inputs.korimer-mini-server.url = "github:Korimer/MinimalNixServer";
  den.hosts.aarch64-linux.vorkuta.users = {
    asya = {};
  };

  den.aspects.vorkuta = {
    nixos = { pkgs, ... }:
    {
      nixpkgs.buildPlatform = builtins.currentSystem;
      nixpkgs.hostPlatform = "aarch64-linux";
      system.stateVersion = "26.11";

      # Hardware
      fileSystems = {
        "/" = {
          device = "/dev/disk/by-uuid/44444444-4444-4444-8888-888888888888";
          fsType = "ext4";
        };
      };
      swapDevices = [ { device = "/swapfile"; size = 1024; } ];

      hardware.enableRedistributableFirmware = true;

      # networking
      networking.wireless.enable = true;  
      networking.hostName = "vorkuta";

      time.timeZone = "America/Denver";
      services.openssh.enable = true;

      security.sudo.wheelNeedsPassword = false;

      # Boot
      boot.kernelPackages = pkgs.linuxPackages_latest;

      boot.kernelParams = [
        "console=ttyS1,115200n8"
      ];

    };
  };
}
