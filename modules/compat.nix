{ ... }:
{
  den.default = {
    nixos = {
      imports = [ ./_nondendric/static/configuration.nix ];
    };
  };
  den.aspects.magic = {
    nixos = {
      imports = [ ./_nondendric/system-specific/home-laptop/core.nix ];
    };
  };
  den.aspects.netzach = {
    nixos = {
      imports = [ ./_nondendric/system-specific/home-pc/core.nix ];
    };

  };
  den.aspects.fortnite = {
    nixos = {
      imports = [ ./_nondendric/system-specific/work-pc/core.nix ];
    };
  };
}
