{ ... }:
{
  den.aspects.korimer.provides.fish = {
    nixos = { pkgs, ... }:
    {
      programs.fish.enable = true;
      users.defaultUserShell = pkgs.fish;
    };
  };
}
