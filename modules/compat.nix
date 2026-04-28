{ ... }:
{
  den.default = {
    nixos = {
      imports = [ ./_nondendric/static/configuration.nix ];
    };
  };
  den.aspects.magic = {
    nixos =
    {
      imports = [ ./_nondendric/system-specific/home-laptop/core.nix ];
    };
  };
}
