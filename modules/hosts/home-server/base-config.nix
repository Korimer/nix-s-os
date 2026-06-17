{
  den.aspects.vorkuta = {
    nixos = { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [ vim git htop ];

      nix.settings.experimental-features = [ "nix-command" "flakes" ];

      networking.hostName = "vorkuta";

      time.timeZone = "America/Denver";

      security.sudo.wheelNeedsPassword = false;

      system.stateVersion = "26.11";
    };
  };
}
