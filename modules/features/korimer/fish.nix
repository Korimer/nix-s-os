{ korimer, ... }:
{
  korimer.everywhere.includes = [ korimer.fish ];
  korimer.fish = {
    nixos = { pkgs, ... }:
    {
      programs.fish.enable = true;
      users.defaultUserShell = pkgs.fish;
    };
  };
}
