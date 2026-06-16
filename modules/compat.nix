{ ... }:
{
  den.aspects.magic = {
    nixos = {
      imports = [
        ./_nondendric/static/configuration.nix
        ./_nondendric/system-specific/home-laptop/core.nix
      ];
    };
  };
  den.aspects.netzach = {
    nixos = {
      imports = [
        ./_nondendric/static/configuration.nix
        ./_nondendric/system-specific/home-system/core.nix
      ];
    };

  };
  den.aspects.fortnite = {
    nixos = {
      imports = [
        ./_nondendric/static/configuration.nix
        ./_nondendric/system-specific/lab-system/core.nix
      ];
    };
  };
}
