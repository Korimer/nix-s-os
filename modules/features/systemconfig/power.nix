{ ... }:
{
  den.aspects.default.provides.upower.nixos = {
    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;
  };
}
