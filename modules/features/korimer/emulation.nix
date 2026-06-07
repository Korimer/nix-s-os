{ den, ... }:
{
  den.aspects.korimer.provides.fish = {
    includes = [ den.aspects.flatpak ];
    nixos = { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        lutris-unwrapped
          umu-launcher
          heroic
          pcsx2
      ];

      services.flatpak.packages = [ "com.usebottles.bottles" ];
    };
  };
}
