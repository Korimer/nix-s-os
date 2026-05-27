{ den, ... }:
{
  den.aspects.korimer.provides.comma = {
    includes = [ den.aspects.nix-index ];
    nixos = { ... }: {
      programs.nix-index-database.comma.enable = true;
    };
  };
}


