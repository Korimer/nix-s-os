{ ... }:
{
  den.aspects.korimer.provides.fish = {
  nixos = { pkgs, ... }:
  {
    environment.systemPackages = with pkgs; [
      lutris-unwrapped
    ];
  };
  };
}
