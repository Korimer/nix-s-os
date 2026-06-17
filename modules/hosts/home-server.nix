{ currentSystem, inputs, ... }:
{
  flake-file.inputs.korimer-mini-server.url = "github:Korimer/MinimalNixServer";
  den.hosts.aarch64-linux.vorkuta.users = {
    asya = {};
  };

  den.aspects.vorkuta = {
    nixos = { pkgs, ... }:
    {
      imports = with inputs.korimer-mini-server.nixosModules; [
        local-admin # aka asya <3
        garbage-collector
        firewall
        fail2ban
        ssh
        nix-trust
      ];
      #Nix
      nix.settings.experimental-features = [ "nix-command" "flakes" ];

      #Building
      nixpkgs.buildPlatform = currentSystem;
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
      networking.hostName = "vorkuta";

      time.timeZone = "America/Denver";

      security.sudo.wheelNeedsPassword = false;

      environment.systemPackages = with pkgs; [ vim git htop ];

      # Boot
      boot.kernelPackages = pkgs.linuxPackages_latest;
      boot.initrd.availableKernelModules = [ "usbhid" ];
      boot.loader.grub.enable = false;
      boot.loader.generic-extlinux-compatible.enable = true;
      boot.kernelParams = [
        "console=ttyS1,115200n8"
      ];

    };
  };
}
